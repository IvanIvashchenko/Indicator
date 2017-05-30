class CreateBundlesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :bundles_products do |t|
      t.belongs_to :product, index: true
      t.belongs_to :bundle, index: true
    end
  end
end
