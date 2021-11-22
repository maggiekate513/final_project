class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :food_items,
             class_name: "Meal",
             foreign_key: "chef",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
