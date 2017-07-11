cd = File.dirname(__FILE__)
require "#{cd}/make_suggest"
def main(ip,port,s_ip)
  body = ""
  body = get_suggest(ip,port,s_ip)
  id,password,remote_password = insert_password_and_body(body)
  body << get_lan_link(id,password,remote_password)
  puts body
end


if __FILE__ == $0
    main(ARGV[0],ARGV[1],ARGV[2])
end
