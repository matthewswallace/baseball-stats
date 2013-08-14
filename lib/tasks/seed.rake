require 'csv'
task :seed_db => :environment do
	i = 0
	CSV.foreach('Master-small.csv', :headers => true) do |row|
      p = row.to_hash;
      user = User.find_by_playerId(p["playerID"])

      if user.nil?
      	user = User.create!(playerId:p["playerID"]);
      end


      	player = user.players.build(birthYear:p["birthYear"], 
      			nameFirst:p["nameFirst"], nameLast:p["nameLast"])
      	player.save


      puts "Prossesing player number #{i}"

      i = i + 1
    end

    i = 0
    CSV.foreach('Batting-07-12.csv', :headers => true) do |row|
      p = row.to_hash;
      user = User.find_by_playerId(p["playerID"])

      if user.nil?
      	user = User.create!(playerId:p["playerID"]);
      end


      	batting_average = user.batting_averages.build(:G => p["G"], 
      			:AB => p["AB"],:R => p["R"],:H => p["H"], :TWOB => p["2B"],
      			:TREEB => p["3B"],:HR => p["HR"], :RBI => p["RBI"],
      			:SB => p["SB"], :CS => p["CS"], :teamID => p["teamID"], 
      			:yearID => p["yearID"] )
      	batting_average.save


      puts "Prossesing batting average #{i}"

      i = i + 1
    end

    puts "import complete"
end