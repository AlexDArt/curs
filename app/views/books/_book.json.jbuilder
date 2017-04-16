json.extract! book, :id, :isbn, :name, :part, :imprint_year, :number_of_shelf, :stack_id, :number_of_copies, :created_at, :updated_at
json.url book_url(book, format: :json)
