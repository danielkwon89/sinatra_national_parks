class CreateParksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.string :description
      t.string :activities
      t.string :photo_urls
      t.timestamps
    end
  end
end
