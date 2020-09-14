class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.string :name, null: false
      t.string :full_name, null: false
      t.string :url, null: false
      t.timestamps
    end
    add_index :repositories, :name, unique: true
    add_index :repositories, :full_name, unique: true
    add_index :repositories, :url, unique: true
  end
end
