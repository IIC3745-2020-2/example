class CreateCommits < ActiveRecord::Migration[6.0]
  def change
    create_table :commits do |t|
      t.string :sha, null: false
      t.string :message, null: false
      t.string :pusher, null: false
      t.string :ref, null: false
      t.integer :pushed_at, null: false
      t.belongs_to :repository, null: false
      t.timestamps
    end
    add_index :commits, :sha, unique: true
  end
end
