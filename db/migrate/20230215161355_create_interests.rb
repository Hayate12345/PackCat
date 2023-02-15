class CreateInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :interests do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
