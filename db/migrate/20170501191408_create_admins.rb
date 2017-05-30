class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email,          :null => false, :default => ""
      t.string :password_digest, :null => false, :default => ""
      t.string :firstname,      :null => false, :default => ""
      t.string :lastname,       :null => false, :default => ""
      t.string :avatar,         :null => false, :default => ""
      t.string :photo,          :null => false, :default => ""
      t.date :birth_date

    end
  end
end
