class CreateTables < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :username
  		t.string :email
  		t.string :password_hash

  		t.timestamps
  	end

  	create_table :nudges do |t|
  		t.string :receiver_name
  		t.string :phone_num
  		t.text :message
  		t.date :date
  		t.time :time
  		t.references :user

  		t.timestamps
  	end
  end
end
