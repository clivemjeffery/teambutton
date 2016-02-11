# Usage: ruby client3.rb host port team

require 'socket'      # Sockets are in standard library

Shoes.app(title: "TeamButton") do

	hostname = "192.168.1.64" # ARGV[0]
	port = 2000 # ARGV[1]
	team = "shoes" # ARGV[2]
	
	stack {
		caption "Connection"
		flow {
			inscription "Hostname :", :width => 500, stroke: red
			@hostedit = edit_line
			@hostedit.text = hostname
		}
		flow {
			inscription "Port number: "
			@portedit = edit_line
			@portedit.text = port
		}
		flow {
			inscription "Team name:"
			@teamedit = edit_line
			@teamedit.text = team
		}
	}

	stack {
		@connect_button = button "Connect"
		@team_button = button "We know!", :height => 300
	}

	@connect_button.click {

		@info = para "Setting up..."
		@info.text = "#{@hostedit.text}, #{port.to_s}, #{@teamedit.text}"

		@s = TCPSocket.open(@hostedit.text, port)
		@s.puts @teamedit.text # send team name 

		handshake = @s.gets # receive handshake
		para handshake
	}

	@team_button.click {
		@s.puts team
	}
end