class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2 
	game.each { |player| 
		raise NoSuchStrategyError unless ["S","P","R"].include? player[1] 
	}
	if (game[0][1] == "S" and (game[1][1] =="S" or game[1][1]=="P"))
		return game[0]
	end
	if (game[0][1] == "P" and (game[1][1] =="R" or game[1][1]=="P"))
		return game[0]
	end
	if (game[0][1] == "R" and (game[1][1] =="R" or game[1][1]=="S"))
		return game[0]
	else
		return game[1]
	end
end


def rps_tournament_winner(tournament)
	x = rps_game_winner(tournament)
	rescue NoSuchStrategyError
		return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
	return x
end

rps_tournament_winner([[[["Armando","P"], ["Dave","S"]],[["Richard","R"],["Michael","S"]],],[[["Alen","S"],["Omer","P"]], [["David", "R"],["Richard X.", "P"]]]])

