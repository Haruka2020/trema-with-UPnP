require 'socket'
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
