require 'socket'      # Sockets are in standard library

hostname = '172.23.56.86' # my PC at school -> move to setting or argument
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets   # Read lines from the socket
	puts line.chop      # And print with platform line terminator
end
s.close               # Close the socket when done