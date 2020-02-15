class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t| #can call more objects on t object within pipes
      t.string :name 
      t.string :email
      t.string :password_digest #password digest encrypts password using bcrypt

      t.timestamps null: false
    end 

  end

end
