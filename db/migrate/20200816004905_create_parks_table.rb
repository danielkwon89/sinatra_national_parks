class CreateParksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :image_url
      t.string :location
      t.string :date_established
      t.string :visitors
      t.string :description
      t.integer :user_id
      t.integer :review_id
      # t.float :rating
      t.timestamps
    end
  end
end