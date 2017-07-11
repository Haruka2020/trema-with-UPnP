
body = `ruby lan_suggest.rb 192.168.11.1 50324 192.168.11.11`
system("ruby send_mail/send_message.rb '#{body}'")
puts body
#body =`ruby wan_suggest.rb 192.168.11.1 50324 192.168.11.13`
#puts body
