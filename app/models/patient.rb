class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_many :institutions, through: :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
