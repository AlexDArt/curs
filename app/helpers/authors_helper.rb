module AuthorsHelper
  def author_options()
    Author.all.pluck('author_index, id')
  end
end
