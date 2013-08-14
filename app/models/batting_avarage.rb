# == Schema Information
#
# Table name: batting_avarages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  yearID     :integer
#  teamID     :string(255)
#  G          :integer
#  AB         :integer
#  R          :integer
#  H          :integer
#  TWOB       :integer
#  TREEB      :integer
#  HR         :integer
#  RBI        :integer
#  SB         :integer
#  CS         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BattingAvarage < ActiveRecord::Base
  attr_accessible :TWOB, :TREEB, :AB, :CS, :G, :H, :HR, :R, :RBI, :SB, :teamID, :user_id, :yearID
  belongs_to :user
end
