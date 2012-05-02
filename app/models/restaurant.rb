class Restaurant < ActiveRecord::Base
  attr_accessible :area, :image, :location, :name, :payment_options, :price_range, :service, :theme, :time, :vegi
end
