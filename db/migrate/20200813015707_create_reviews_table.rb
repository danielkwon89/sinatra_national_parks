class CreateReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      # t.string # :upvote...?
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :park_id
      # t.integer :park_id # rollback migrate and re-migrate later
      # does a user have many reviews through parks? many-to-many relationship?
      t.timestamps
    end
  end
end