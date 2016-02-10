require 'socket'      # Sockets are in standard library

# hostname = '172.23.56.86' # my PC at school -> move to setting or argument
hostname = 'localhost'
port = 2000
team = ARGV[0]

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