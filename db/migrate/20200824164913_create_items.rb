class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :content
      t.boolean :aquired
      t.belongs_to :list
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
