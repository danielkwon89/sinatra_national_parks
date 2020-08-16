class CreateParksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :image_url
      t.string :location
      t.string :date_established
      t.string :visitors
      t.string :description
      t.timestamps
    end
  end
end