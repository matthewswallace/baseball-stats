# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  nameFirst  :string(255)
#  nameLast   :string(255)
#  birthYear  :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
