class AddShowcaseImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :showcase_image, :string
  end
end
