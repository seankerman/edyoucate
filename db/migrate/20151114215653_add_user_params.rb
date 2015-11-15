class AddUserParams < ActiveRecord::Migration
  def up

  	remove_column("users", "name")
  	add_column("users", "first_name", :string, :limit => 25)
  	add_column("users", "last_name", :string, :limit => 50)
  	add_column("users", "email", :string, :limit => 100)
  	add_column("users", "username", :string, :limit => 25)
  	add_column("users", "hashed_password", :string, :limit => 40)

  end

  def down
  	add_column("users", "name", :string)
  end
end
