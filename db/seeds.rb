if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

Hall.create(full_name: "Зал №1", short_name: "1H")
Hall.create(full_name: "Зал №2", short_name: "2H")
Stack.create(index: 0111, hall_id: 1)
Stack.create(index: 0201, hall_id: 2)
Book.create(isbn: 2944771, name: "New", imprint_year: 2017, number_of_shelf: 3, stack_id: 1, number_of_copies: 2)
Book.create(isbn: 1354418, name: "Old", part: 2, imprint_year: 1990, number_of_shelf: 1, stack_id: 2, number_of_copies: 1)
Author.create(author_index: 1411, first_name: "Иван", last_name: "Иванов", second_name: "Иванович")
Author.create(author_index: 0274, first_name: "Петр", last_name: "Петров", second_name: "Петрович")
Author.first.books << Book.first
Author.first.books << Book.second
Author.second.books << Book.second

