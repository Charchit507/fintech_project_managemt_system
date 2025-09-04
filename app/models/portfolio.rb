class Portfolio < ApplicationRecord
  belongs_to :contact
  validates :name, :balance, :performance, presence: true
end
