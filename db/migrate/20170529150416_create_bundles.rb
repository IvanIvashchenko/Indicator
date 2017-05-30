class CreateBundles < ActiveRecord::Migration[5.0]
  def change
    create_table :bundles do |t|
      t.string :name,         null: false, default: ""
      t.float :price,         null: false, precision: 9, scale: 2
    end
  end
end
