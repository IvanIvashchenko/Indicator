class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :email,          :null => false, :default => ""
      t.string :password_digest, :null => false, :default => ""
      t.string :avatar,         :null => false, :default => ""
      t.string :shop,           :null => false, :default => ""
    end
  end
end
