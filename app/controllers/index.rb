get '/' do
  erb :index
end

post "/profile" do 
	user = User.new(params[:user])
	if user.save
  	session[:user_id] = user.id
  	redirect "/user/#{user.id}"
  else
  	redirect "/"
  end
end

get "/user/:id" do
  @user = User.find(params[:id])
  @decks = Deck.all
  erb :user_profile
end

get "/deck/:id" do
  @deck = Deck.find(params[:id])
	  set_round(@deck)
  erb :game
end

post "/deck/:deck_id/card/:card_id" do
	content_type :json
	@card = Card.find_by_id(params[:card_id])
	guess = Guess.create( {card_id: params[:card_id], round_id: session[:round_id] })

	p "*"*50
	p params[:user_guess]
	p "*"*50
	if @card.answer.downcase == params[:user_guess].downcase
		guess.correct = true
	end
		guess.to_json
end

get '/logout' do
  session.clear
  redirect to('/')
end
