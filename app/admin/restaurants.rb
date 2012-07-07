ActiveAdmin.register Restaurant do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :theme, :label => "Theme", :as => :select, :collection => Restaurant::THEMES
      f.input :payment_options, :as => :check_boxes, :collection => Restaurant::PAYMENT_OPTIONS
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
