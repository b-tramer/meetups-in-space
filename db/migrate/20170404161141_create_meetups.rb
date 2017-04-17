class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.string :description, null: false
      table.string :location, null: false
      table.string :date
      table.string :time
      table.integer :user_id
      table.timestamps null: false
    end
  end
end
