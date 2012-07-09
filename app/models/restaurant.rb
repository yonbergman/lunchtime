class Restaurant < ActiveRecord::Base


  attr_accessible :name, :theme, :image, :payment_options, :price_range, :menu_url #, :service, :theme, :time, :vegi
  attr_accessible :location, :area, :address, :heading

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

  PAYMENT_OPTIONS = ["cash","credit","10bis"]
  PRICE_RANGES = {"0-35" => -1, "35-55" => 0 ,"55-70" => 1}

  validates_presence_of :name, :location

  def payment_options
    return [] if self[:payment_options].nil?
    self[:payment_options].split("|").map(&:to_sym)
  end

  def payment_options=(val)
    if val.kind_of?(Array)
      val = val.compact.reject{|x| x.empty?}.map(&:to_s).join("|")
    end
    self[:payment_options] = val
  end


  def as_json(opt)
    json = super
    json[:payment_options] = payment_options
    json
  end

end
