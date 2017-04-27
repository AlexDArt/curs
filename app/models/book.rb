class Book < ActiveRecord::Base
  belongs_to :stack
  has_many :author_books
  has_many :authors, through: :author_books
  validates :name, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :imprint_year, presence: true
  validates :stack, presence: true
  validates :number_of_shelf, presence: true
  validates :number_of_copies, presence: true
  validates :part, uniqueness: {scope: [:imprint_year, :isbn]}



end
