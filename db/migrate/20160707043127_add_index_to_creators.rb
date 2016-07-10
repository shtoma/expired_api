class AddIndexToCreators < ActiveRecord::Migration
  def change
    add_index :creators, :screen_name, :unique => true
  end
end
