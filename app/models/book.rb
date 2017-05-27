class Book < ActiveRecord::Base
  belongs_to :stack
  has_and_belongs_to_many :authors
  validates :name, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :imprint_year, presence: true
  validates :stack, presence: true
  validates :number_of_shelf, presence: true
  validates :number_of_copies, presence: true
  validates :part, uniqueness: {scope: [:imprint_year, :isbn]}

  accepts_nested_attributes_for :authors,
     reject_if: proc{ |r| r['first_name'].blank? & r['last_name'].blank? & r['author_index'].blank?},
     allow_destroy: true

  def self.search(params)
     result = Book.includes(:authors).includes(:stack => :hall).references(:authors).references(:stack => :hall)
     if params['name'].present?
       result = result.where(name: params['name'])
     end
     if params['isbn'].present?
       result = result.where(isbn: params['isbn'])
     end
     if params['imprint_year'].present?
       result = result.where(imprint_year: params['imprint_year'])
     end
     if params['number_of_copies'].present?
       result = result.where(number_of_copies: params['number_of_copies'])
     end

     if params['stack'].present?
       result = result.where(stack: params['stack'])
     end

     if params['full_name'].present?
       result = result.where(halls: {full_name: params['full_name']})
     end
     if params['short_name'].present?
       result = result.where(halls: {short_name: params['short_name']})
     end

     if params['author_index'].present?
       result = result.where(authors: {author_index: params['author_index']})
     end
     if params['first_name'].present?
       result = result.where(authors: {first_name: params['first_name']})
     end
     if params['second_name'].present?
       result = result.where(authors: {second_name: params['second_name']})
     end
     if params['last_name'].present?
       result = result.where(authors: {last_name: params['last_name']})
     end

     result.all
  end
end
