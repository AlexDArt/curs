module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Начальная страница',
      :icon => 'list',
      :controller => :welcome, 
      :action => :index
    }
    if is_admin?
      result << {
        :name => 'Администрирование',
        :icon => 'users',
        :children => [
        {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'users',
         :class => 'long'},
        {:name => 'Добавление',
         :controller => :users, :action => :new,
         :icon => 'user-plus'},
        {:name => 'Роли',
         :controller => :roles, :action => :index,
         :icon => 'align-center',
         :class => 'long'},
      ]}
      result
    end
    result << {
      :name => 'Библиотека',
      :icon => 'bookmark',
      :children => [
      {:name => 'Стелажи',
       :controller => :stacks, :action => :index,
       :icon => 'inbox',
       :class => 'long'},
      {:name => 'Книги',
       :controller => :books, :action => :index,
       :icon => 'book',
       :class => 'long'},
      {:name => 'Поиск книг',
       :icon => 'search',
       :controller => :books,
       :action => :search,
       :class => 'long'}
    ]}  
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
