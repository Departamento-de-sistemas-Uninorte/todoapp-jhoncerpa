class Task < ApplicationRecord
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :description, length: { maximum: 280 }

  attr_accessor :name, :email
end
