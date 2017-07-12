cd = File.dirname(__FILE__)
require "#{cd}/make_suggest"
def main(ip,port,s_ip,dpid)
  body = ""
  body = get_suggest(ip,port,s_ip)
  id,password= insert_password_and_body_and_dpid(body,dpid)
  body << get_wan_link(id,password)
  puts body
  puts password
end


if __FILE__ == $0
    main(ARGV[0],ARGV[1],ARGV[2])
end
