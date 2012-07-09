ActiveAdmin.register Restaurant do
  index do
     column :name
     column :theme
     column :price_range
     column :payment_options
     default_actions
   end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :theme, :label => "Theme", :as => :select, :collection => Hash[Restaurant::THEMES.map{|x| [x.to_s.humanize,x]}]
      f.input :payment_options, :as => :check_boxes, :collection => Restaurant::PAYMENT_OPTIONS
      f.input :price_range, :as => :select, :collection => Restaurant::PRICE_RANGES
      f.input :image
      f.input :menu_url
    end

    f.inputs "Location" do
      f.input :location, :hint => "Displayed to users"
      f.input :area, :hint => "For grouping purposes"
      f.input :address, :hint => "Used for displaying map"
      f.input :heading, :hint => "Used for showing streetview "
    end

    f.buttons

  end

end
