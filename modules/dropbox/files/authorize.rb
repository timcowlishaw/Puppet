#!/usr/bin/env ruby
require 'net/http'
require 'net/https'
require 'cgi'

@local_username, @dropbox_username, @dropbox_password = *ARGV

#Maintaing a hash of all the cookies set so far
def merge_cookies(cookies, resp)
  cookies.merge(resp.response.to_hash['set-cookie'].inject({}) {|h,c| k, v = c.split(";")[0].split("="); h.merge(k => v) })
end

#Format cookies into a string to be included in the http request header
def format_cookies(cookies)
  cookies.map {|k,v| "#{k}=#{v}" }.join(";")
end

#HTTP get
def get(transport, path, cookies={})
  resp, data = transport.get(path, {"Cookie" => format_cookies(cookies)})
  [data, merge_cookies(cookies, resp)]
end

#HTTP post
def post(transport, path, params, cookies={})
  resp, data = transport.post(path, params, {"Cookie" => format_cookies(cookies)})
  [data, merge_cookies(cookies, resp)]
end

#Register a new host with the user's dropbox account
def register_host(host_id)
  http = Net::HTTP.new('www.dropbox.com', 443)
  http.use_ssl=true
  http.start do |transport|
    cookies = {}

    #Get the login page
    _, cookies = get(transport, "/login", cookies)

    #Log in
    _, cookies = post(transport, "/login", "login_email=#{CGI.escape(@dropbox_username)}&login_password=#{CGI.escape(@dropbox_password)}&login_submit=Log+in", cookies)

    #Get the CLI Link form and parse out the secret nonce that's hidden there
    data, cookies = get(transport, "/cli_link?host_id=#{host_id}", cookies)
    match  = data.match(/name="t" value="(.*?)"/)
    raise "Could not authenticate. Check username and password." unless match
    t = match[1]

    #Post the CLI Link data
    data, _ = post(transport, "/cli_link?host_id=#{host_id}", "t=#{t}&password=#{CGI.escape(@dropbox_password)}", cookies)
    puts data.inspect
  end
end

# run the dropbox command and get the host id
File.popen("~#{@local_username}/.dropbox-dist/dropbox") do |file|
  while line = file.gets
    found = false
    #Look for the authentication URL
    if match = !found && line.match(/host_id=(.*?)&/)
      #Only do this once, if the line's repeated
      found = true
      host_id = match[1]
      begin
        #Perform the authentication process
        register_host(host_id)
        #Wait for the dropbox daemon to refresh its data
        sleep 5
      ensure
        # Don't leave the daemon running
        Process.kill("KILL", file.pid)
        # the dropbox dameon forks and disowns a subcommand, so we have to kill it, rather brutally. Ho hum.
       	`killall dropbox`
        exit
      end
    end
  end
end

