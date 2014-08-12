class AddImageCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_count, :integer, default: 0
  end
end
