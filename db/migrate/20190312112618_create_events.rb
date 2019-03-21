class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.integer :duration
      t.string :spectator_price
      t.text :rules
      t.string :prize_money
      t.string :picture_url
      t.string :city_name
      t.string :zipcode
      t.string :address
      t.float :latitude
      t.float :longitude
      t.belongs_to :promoter, index: true
      t.timestamps
    end
  end
end
