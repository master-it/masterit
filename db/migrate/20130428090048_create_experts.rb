class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.references :nomination
      t.timestamps
    end
  end
end
