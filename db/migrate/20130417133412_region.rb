class Region < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
  
end
