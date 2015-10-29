class PlayerPosition < ActiveRecord::Base
  belongs_to :player, foreign_key: 'user_id', class_name: 'User'
  belongs_to :position
end