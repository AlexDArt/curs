class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :author_index, presence: true, uniqueness: true
end
