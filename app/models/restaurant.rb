class Restaurant < ActiveRecord::Base


  attr_accessible :name, :theme, :location, :area, :image, :payment_options, :price_range, :menu_url,:address #, :service, :theme, :time, :vegi

  has_many :tips
  has_many :checkins

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
      val = val.map(&:to_s).join("|")
    end
    self[:payment_options] = val
  end


  def as_json(opt)
    json = super
    json[:payment_options] = payment_options
    json
  end

end
