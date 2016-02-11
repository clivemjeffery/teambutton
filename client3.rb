# Usage: ruby client3.rb host port team

require 'socket'      # Sockets are in standard library

hostname = ARGV[0]
port = ARGV[1]
team = ARGV[2]

s = TCPSocket.open(hostname, port)
s.puts team # send team name 

$stdout.puts s.gets # echo handshake in
$stdout.flush

$stdout.puts "The 'Enter' key is your button. Ctrl-C or Ctrl-D will disconnect."
$stdout.flush

while $stdin.gets   # Read lines from the input, discarding input as we're only interested in the 'enter'
	s.puts team # send team name on enter
end
$stdout.puts "Disconnecting..."
s.close # close the socket