module BooksHelper
  def link_to_add_author(form, book)
    new_obj = Author.new()
    fld = form.fields_for(:author, new_obj, 
      :child_index => 'new_author') do |df|
      render('books/author_book_form', df: df, i: 'Новый')
    end
    link_to(?#, class: 'btn btn-info', 
        id: 'add_author_link', data: {content: "#{fld}"}) do 
      fa_icon("plus") + " Новый автор" 
    end
  end
  def link_to_remove_author(form)  
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_author') do 
      fa_icon('times', title: 'Удалить автора') + ' Удалить'      
    end
  end
end
