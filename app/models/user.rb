# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  playerId   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :playerId

  has_many :players
  has_many :batting_averages


	def batting_average(yearID)
		averages = batting_averages.where("yearID = ? ", yearID)
		cur_av = 0
		heighest_av = 0
		averages.each do |a|
			cur_av = a.AB / a.H

			if cur_av > heighest_av
				heighest_av = cur_av
			end
		end

		return heighest_av
	end

	def homerun_count(yearID)
		averages = batting_averages.where("yearID = ? ", yearID)
		averages = averages.sort {|hs| hs[:HR]}
		return averages.last
	end

	def rbi_count(yearID)
		averages = batting_averages.where("yearID = ? ", yearID)
		averages = averages.sort {|hs| hs[:RBI]}
		return averages.last
	end
end
