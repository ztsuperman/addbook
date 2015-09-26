class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.string :contact_fname
      t.string :contact_lname
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
#wuyule..
