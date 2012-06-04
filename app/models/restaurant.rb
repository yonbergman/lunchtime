class Restaurant < ActiveRecord::Base
  attr_accessible :area, :image, :location, :name, :payment_options, :price_range, :service, :theme, :time, :vegi

  enum :theme, [:bistro,
                :sandwich_bar,
                :italian,
                :fish,
                :veggie,
                :home,
                :hummus,
                :burger,
                :asian
               ]

  def payment_options
    self[:payment_options].split("|").map(&:to_sym)
  end

  def payment_options=(val)
    if val.kind_of?(Array)
      val = val.map(:to_s).join("|")
    end
    self[:payment_options] = val
  end

end
