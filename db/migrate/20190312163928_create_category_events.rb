class CreateCategoryEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :category_events do |t|
      t.belongs_to :category, index: true
      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
