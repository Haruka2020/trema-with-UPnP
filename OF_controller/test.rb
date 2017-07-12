require "socket"

body,id = `ruby lan_suggest.rb 192.168.11.1 50324 192.168.11.11 1`
puts body
system("ruby send_mail/send_message.rb '#{body}'")

port = 9999
server = TCPServer.open(port)

while true
  Thread.start(server.accept) do |socket|
    p socket.peeraddr

    while buffer = socket.gets
      p buffer
      p buffer.split(',')[1]
    end

    socket.close
  end
end

server.close
#body =`ruby wan_suggest.rb 192.168.11.1 50324 192.168.11.13`
#puts body
