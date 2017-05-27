module AuthorsHelper
  def author_options()
    Author.all.pluck('author_index, id, first_name, last_name')
  end
end
