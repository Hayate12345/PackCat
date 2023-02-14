class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.string :image
      t.string :amount
      t.string :place
      t.timestamps
    end
  end
end
