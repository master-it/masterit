class WorkSource < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :work_id

      t.timestamps
    end
  end
end
