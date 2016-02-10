require 'socket'      # Sockets are in standard library

hostname = 'ICT-WIN7-13.school.norton-pri.n-yorks.sch.uk'
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets   # Read lines from the socket
	puts line.chop      # And print with platform line terminator
end
s.close               # Close the socket when done