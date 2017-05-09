class Hall < ActiveRecord::Base
  has_many :stacks, dependent: :destroy
  
  validates :short_name, presence: true
  validates :full_name, presence: true, uniqueness: {scope: [:short_name]}
end
