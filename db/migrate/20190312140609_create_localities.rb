class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|
      t.string :city_name
      t.string :zipcode
      t.string :address
      # t.float :latitude #geocoder
      # t.float :longitude #geocoder
      t.timestamps
    end
  end
end
