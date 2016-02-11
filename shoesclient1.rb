# Usage: ruby client3.rb host port team

require 'socket'      # Sockets are in standard library

Shoes.app do

	hostname = "172.23.56.86" # ARGV[0]
	port = 2000 # ARGV[1]
	team = "shoes" # ARGV[2]
	
	@hostedit = edit_line
	@hostedit.text = hostname
	@portedit = edit_line
	@portedit.text = port
	@teamedit = edit_line
	@teamedit.text = team
	
	@connect_button = button "Connect"
	@connect_button.click {

		@info = para "Setting up..."
		@info.text = "#{@hostedit.text}, #{port.to_s}, #{@teamedit.text}"

		@s = TCPSocket.open(@hostedit.text, port)
		@s.puts @teamedit.text # send team name 

		handshake = @s.gets # receive handshake
		title handshake
	}

	@team_button = button "We know!"
	@team_button.click {
		@s.puts team
	}
end