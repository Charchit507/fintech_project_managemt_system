class Contact < ApplicationRecord
  belongs_to :organization
  has_many :portfolios, dependent: :destroy
  validates :name, :email, presence: true
end
