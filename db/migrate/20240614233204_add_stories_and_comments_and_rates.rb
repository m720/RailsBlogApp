class AddStoriesAndCommentsAndRates < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.timestamps
    end

    create_table :stories do |t|
      t.string :title
      t.text :body
      t.integer :comments_count, default: 0
      t.float :average_rate, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end

    create_table :comments do |t|
      t.text :body
      t.references :story, foreign_key: true
      t.references :user, foreign_key: true
    end

    create_table :rates do |t|
      t.integer :rate_value
      t.references :user, foreign_key: true
      t.references :story, foreign_key: true
    end
  end
end
