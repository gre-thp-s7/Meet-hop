class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.string :role
      
      t.timestamps
    end
  end
end
