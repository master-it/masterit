class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :nomination
      t.string :image
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
