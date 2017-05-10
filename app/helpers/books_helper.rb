module BooksHelper
  def link_to_add_author(form, book)
    # Создаём новый объект. Аналог build в ранних примерах
    new_obj = Author.new()
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер 
    # Мы его пока заменям на фразу new_ru
    fld = form.fields_for(:author, new_obj, 
      :child_index => 'new_author') do |df|
      render('books/author_book_form', df: df, i: 'Новый')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info', 
        id: 'add_author_link', data: {content: "#{fld}"}) do 
      fa_icon("plus") + " Новый автор" 
    end
  end
  def link_to_remove_author(form)  
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_author') do 
      fa_icon('times', title: 'Удалить автора') + ' Удалить'      
    end
  end
end
