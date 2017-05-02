class AddShopToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :shop, :string
  end
end
