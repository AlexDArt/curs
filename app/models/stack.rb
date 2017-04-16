class Stack < ActiveRecord::Base
  belongs_to :hall
  has_many :books
  
  validates :index, presence: true
  validates :hall, presence: true
end
