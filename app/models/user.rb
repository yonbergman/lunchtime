class User < ActiveRecord::Base
  attr_accessible :company_id, :name, :role

  has_many :authentications
  belongs_to :company
  has_many :checkins
  has_many :tips
end
