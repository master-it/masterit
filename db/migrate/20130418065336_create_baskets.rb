class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :state
      t.references :users
      t.referances :works
      t.timestamps
    end
  end
end
