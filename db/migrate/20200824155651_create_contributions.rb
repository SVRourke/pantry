class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.belongs_to :user
      t.belongs_to :list
      t.string :role
      t.timestamps null: false
    end
  end
end
