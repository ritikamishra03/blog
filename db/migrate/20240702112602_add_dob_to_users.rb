class AddDobToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :dob, :string
  end
end
