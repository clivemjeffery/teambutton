require 'socket'                # Get sockets from stdlib

server = TCPServer.open(2000)   # Socket to listen on port 2000
loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
	10.times do
		client.puts(Time.now.ctime) # Send the time to the client
		client.puts "Holding the connection. Wait a sec!"
		sleep(1)
	end
	client.puts "Closing the connection. Bye!"
    client.close                # Disconnect from the client
  end
}