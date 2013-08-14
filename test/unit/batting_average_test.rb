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

require 'test_helper'

class BattingAverageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
