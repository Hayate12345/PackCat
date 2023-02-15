class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :content
      t.string :belongings
      t.string :place
      t.timestamps
    end
  end
end
