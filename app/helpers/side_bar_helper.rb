module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Сслыка без детей',
      :icon => 'list',
      :controller => :welcome, 
      :action => :index
    }
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
    result << {
      :name => 'Заголовок ссылок',
      :icon => 'search-plus',
      :children => [
      {:name => 'Ссылка ребёнок',
       :controller => :welcome, :action => :index,
       :icon => 'binoculars'},
      {:name => 'Ссылка ребёнок',
       :controller => :welcome, :action => :index,
       :icon => 'search',
       :class => 'long'}
    ]}
    result << {
      :name => 'Библиотека',
      :icon => 'bookmark',
      :children => [
      {:name => 'Библиотечные залы',
       :controller => :halls, :action => :index,
       :icon => 'asterisk'},
      {:name => 'Стелажи',
       :controller => :stacks, :action => :index,
       :icon => 'inbox',
       :class => 'long'},
      {:name => 'Книги',
       :controller => :books, :action => :index,
       :icon => 'book',
       :class => 'long'},
      {:name => 'Авторы',
       :controller => :authors, :action => :index,
       :icon => 'pencil',
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
