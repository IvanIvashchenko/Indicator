class AddIsProToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_pro, :boolean, :default => false
  end
end
