class WorkImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :work_id

      t.timestamps
    end
  end
end
