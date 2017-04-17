class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :provider, null: false
      table.string :uid, null: false
      table.string :username, null: false
      table.string :email, null: false
      table.string :avatar_url, null: false
      table.timestamps null: false
    end
    add_index :users, [:uid, :provider], unique: true
  end
end




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




class CreateMeetupsUsers < ActiveRecord::Migration
  def change
    create_table :meetup_users do |t|
      t.integer :meetup_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
