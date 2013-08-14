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

class Player < ActiveRecord::Base
  attr_accessible :birthYear, :nameFirst, :nameLast, :user_id
  belongs_to :user
end
