class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :confirmable, :lockable,
  # :timeoutable, :trackable, :registerable and :omniauthable
  devise :database_authenticatable, :validatable

  # Devise Token Auth
  include DeviseTokenAuth::Concerns::User

  # Validates
  validates :full_name, length: { minimum: 3, maximum: 100 }
end
