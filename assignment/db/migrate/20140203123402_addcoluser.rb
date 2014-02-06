class Addcoluser < ActiveRecord::Migration
  def change
 
add_column :users, :name, :string


add_column :users, :City, :string


  end
end
