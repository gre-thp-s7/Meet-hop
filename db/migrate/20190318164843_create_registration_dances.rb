class CreateRegistrationDances < ActiveRecord::Migration[5.2]
  def change
    create_table :registration_dances do |t|
      t.belongs_to :registration, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
