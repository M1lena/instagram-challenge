#new
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :rating

      t.timestamps null: false
    end
  end
end
