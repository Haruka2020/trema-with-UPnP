cd = File.dirname(__FILE__)
require "#{cd}/make_suggest"
require "#{cd}/send_mail/send_message"
def main(ip,port,s_ip,dpid)
  body = ""
  body = get_suggest(ip,port,s_ip)
  id,password,remote_password = insert_password_body_dpid(body,dpid)
  body << get_lan_link(id,password,remote_password)
  send_mail(body)
  puts id

end


if __FILE__ == $0
    main(ARGV[0],ARGV[1],ARGV[2],ARGV[3])
end
