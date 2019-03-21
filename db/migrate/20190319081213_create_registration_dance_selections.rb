class CreateRegistrationDanceSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :registration_dance_selections do |t|

      t.timestamps
    end
  end
end
