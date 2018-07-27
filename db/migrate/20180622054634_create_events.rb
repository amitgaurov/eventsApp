class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date
      t.text :place
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
