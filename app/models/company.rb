class Company < ApplicationRecord
  belongs_to :user
  has_many :workers, dependent:  :destroy
  validates :name, presence: true
end
