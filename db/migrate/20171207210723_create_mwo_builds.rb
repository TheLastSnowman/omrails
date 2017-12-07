class CreateMwoBuilds < ActiveRecord::Migration[5.1]
  def change
    create_table :mwo_builds do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :mech
      t.index :mech
      t.string :url
      t.text :comments

      t.timestamps
    end
  end
end
