class Institution < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :doctors, dependent: :destroy
    has_many :services, dependent: :destroy
    has_many :patients, through: :appointments
end
