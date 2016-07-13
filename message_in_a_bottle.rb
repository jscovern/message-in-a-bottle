class MessageInABottle < Sinatra::Base

	@@beaches_counter = 0

	get '/' do
		"Stranded on desert island, each day you search one beach."
		erb :index
	end

	get '/beach' do
		@@beaches_counter+=1
		@beach_location=params[:location]
		puts @beach_location
		puts @@beaches_counter
		if @@beaches_counter >= 20
			@message = "You search the beach, but there are no more bottles"
		elsif @@beaches_counter % 5 == 0
			@message = "Ouch! There was a crab in the bottle."
		elsif @beach_location == "east"
			@message = "Argh, the Island of Tortuga runs short of turtles."
		else
			@message = "It's totally awesome to write messages in your used bottles at the end of a spring break rager!"
		end
		puts @message

		erb :beach
	end
end