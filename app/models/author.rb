class Author < ActiveRecord::Base
  has_many :author_books
  has_many :books, through: :author_books
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :author_index, presence: true
end
