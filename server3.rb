require 'thread'
require 'socket'                # Get sockets from stdlib

host = '0.0.0.0'
port = 2000

win = "control"
win_sem = Mutex.new

server = TCPServer.open(host, port)   # Socket to listen on all interaces at port 2000
puts "Starting #{$0} to listen on port #{port}"

loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
	puts "Accepted connection from #{client.peeraddr}"
	team = client.gets.strip
	puts "Team name is #{team}"
	client.puts("Welcome team #{team}. You are connected.")
	client.flush
	while sent = client.gets
		win_sem.synchronize {
			if win == "control" || team == "control" then
				win = team
				puts "#{team} wins!"
			end
		}
		hit_time = Time.now
		puts "#{hit_time.strftime('%H:%M:%S.%L')} #{team}"
	end
	puts "#{team} has disconnected."
	client.close                # Disconnect from the client
  end
}