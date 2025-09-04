class Organization < ApplicationRecord
  has_many :contacts, dependent: :destroy
  validates :name, :email, presence: true
end
