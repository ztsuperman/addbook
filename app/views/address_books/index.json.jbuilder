json.array!(@address_books) do |address_book|
  json.extract! address_book, :id, :contact_fname, :contact_lname, :email, :phone, :address, :city, :state, :zip
  json.url address_book_url(address_book, format: :json)
end
