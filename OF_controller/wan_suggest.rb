require './make_suggest'
def main(ip,port,s_ip)
  body = ""
  body = get_suggest(ip,port,s_ip)
  id,password = insert_password()
  body << get_wan_link(id,password)
  puts body
end


if __FILE__ == $0
    main(ARGV[0],ARGV[1],ARGV[2])
end
