helpers do 
	def set_round(deck_object)
		round = Round.new({ deck_id: deck_object.id, user_id: session[:user] })
		session[:round_id] = round.id
	end
end