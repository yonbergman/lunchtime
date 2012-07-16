class Tip < ActiveRecord::Base
  attr_accessible :checkin_id, :content, :restaurant_id, :user_id
end
