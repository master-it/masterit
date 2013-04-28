class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.references :region
      t.timestamps
    end
  end
end
