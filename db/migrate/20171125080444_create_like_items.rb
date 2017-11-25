class CreateLikeItems < ActiveRecord::Migration[5.0]
  def change
    create_table :like_items do |t|
      t.integer :user_id, :index => true
      t.integer :product_id, :index => true
      t.timestamps
    end
  end
end
