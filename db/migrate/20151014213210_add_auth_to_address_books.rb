class AddAuthToAddressBooks < ActiveRecord::Migration
  def change
    add_column :address_books, :auth, :string
  end
end
