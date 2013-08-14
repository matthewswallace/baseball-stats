# == Schema Information
#
# Table name: batting_averages
#
#  id         :integer          not null, primary key
#  TWOB       :integer
#  TREEB      :integer
#  AB         :integer
#  CS         :integer
#  G          :integer
#  H          :integer
#  HR         :integer
#  R          :integer
#  RBI        :integer
#  SB         :integer
#  teamID     :string(255)
#  user_id    :integer
#  yearID     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BattingAverage < ActiveRecord::Base
  attr_accessible :AB, :CS, :G, :H, :HR, :R, :RBI, :SB, :TREEB, :TWOB, :teamID, :user_id, :yearID
  belongs_to :user

  def fantasy_points
  	((self.H * 4) + (self.RBI * 1) + (self.SB * 1)) - self.CS
  end

  def average
  	if !self.AB.nil? and !self.H.nil?
  		a = self.AB
  		b = self.H
  		

  		if a == 0
  			a = 1
  		end

  		if b == 0
  			b = 1
  		end

  		b/a
  	else
  		0
  	end
  end
end
