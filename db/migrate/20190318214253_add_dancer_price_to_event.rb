class AddDancerPriceToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :dancer_price, :string
  end
end
