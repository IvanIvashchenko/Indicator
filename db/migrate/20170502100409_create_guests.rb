class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :email,          :null => false, :default => ""
      t.string :password_digest, :null => false, :default => ""
    end
  end
end
