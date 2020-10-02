class Task < ApplicationRecord
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :description, length: { maximum: 280 }
end
