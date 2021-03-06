class Doctor < ApplicationRecord
  belongs_to :institution
  has_many :services, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
