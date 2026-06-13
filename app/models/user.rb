class User < ApplicationRecord
  validates :name, :DOB, :email, :phone_number, presence:
  true

  # Validate email structure
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Validate email uniqueness at model level
  validates :email, uniqueness: true
end