class BaseballStatsController < ApplicationController

	def index

	end

	def improved_batting
		batting_averages = BattingAverage.where("yearID > ? and yearID < ? and AB > ?", 
												2008, 2013,199 ).order("yearID asc")

		user = nil
		
		most_improved = 0
		most_improved_average = nil
		current_imporved = 0
		bat_average1 = 0
		bat_average3 = 0

		batting_averages.each do |ba|
			
			if ba.yearID == 2009
				bat_average1 = ba.AB / ba.H
			elsif ba.yearID == 2010
				bat_average3 = ba.AB / ba.H
			end

			

			current_imporved = bat_average3 - bat_average1


			if current_imporved > most_improved
				most_improved = current_imporved
				most_improved_average = ba
				user = ba.user
			end
		end	

		render :json => {batting_average: most_improved_average, improved_average:most_improved, user: user}
	end

	def slugging_percentage
		batting_averages = BattingAverage.where("yearID = ? and teamID = ? ", 
												2007, "OAK" ).order("yearID asc")

		players = []

		batting_averages.each do |average|
			slugging = 0
			atbats = 1

			av = ((average.H.to_i - average.TWOB.to_i - average.TREEB.to_i - average.H.to_i) +
							(2* average.TWOB.to_i) + (3 * average.TREEB.to_i) + (4 * average.H.to_i))
			av = 1 if av == 0

			atbats = average.AB.to_i if average.AB.to_i > 0
			if !average.nil?
				slugging = atbats / av
				players << {playerID:average.user.playerId, slugging:slugging}
			end

		end

		render :json => {players:players}
	end

	def top_imporved

		batting_averages = BattingAverage.where("yearID > ? and yearID < ? and AB > ?", 
												2010, 2013,499 ).order("yearID asc")
		most_points_improved = 0
		current_points_imporoved = 0
		top_five = []

		batting_averages.each do |average|
			user_averages = batting_averages.where("user_id = ?", average.user.id)
			av1 = 0
			av2 = 0
			cur_av = nil
			user_averages.each do |ua|
				if ua.yearID == 2011
					av1 = ua.fantasy_points
				elsif ua.yearID == 2012
					av2 = ua.fantasy_points
				end
			end
			if user_averages.count == 2
				top_five << {points_imporved:av2 - av1, user: average.user, av1:av1, av2:av2, averages:user_averages}
			end
		end

		render :json => {top_five:top_five.sort_by {|hsh| hsh[:points_imporved]}}
	end

	def trip_crown_winner
		batting_averages = BattingAverage.all
		batting_averages.sort_by {|av| av[:yearID]}

		current_year = 0
		year = 0

		year_array = []
		averages_by_date = []

		batting_averages.each do |average|
			current_year = average.yearID
			
			year = current_year if year == 0

			does_exist = false

			year_array.each do |y|
				if y == year
					does_exist = true
				end
			end

			if !does_exist
				year_array << year
			end
				does_exist = true

			year_array = year_array.sort

			year = current_year if current_year < year
			puts "year : #{year}"

		end

		year_array.each do |y|
			ba = []
			ba = BattingAverage.where("yearID = ?", y)
			averages_by_date <<  ba
		end

		# averages_by_date.each do |a|
		# 	puts "var type #{a}"
		# 	a.order("RBI")
		# 	a.order("HR")			
		# end

		uid = nil

		averages_by_date.each do |av|
			av = av.order("RBI")
			uid1 = av[av.count-1].user.playerId
			av = av.order("HR")
			uid2 = av[av.count - 1].user.playerId

			av = av.sort_by {|a| a.average}
			uid3 = av[0].user.playerId
			#uid3 = av[av.count-3].user.playerId

puts "uid1 and uid2 and uid3 : #{uid1} : #{uid2} : #{uid3}"
			if uid1 == uid2 && uid1 == uid3

				uid = uid1
			end
		end

		render :json => {winner:uid}
	end

end
