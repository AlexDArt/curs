class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  validates :second_name, presence: true
  validates :first_name, presence: true
  validates :author_index, presence: true
end
