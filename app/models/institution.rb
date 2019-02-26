class Institution < ApplicationRecord
    has_many :appointments
    has_many :doctors, , dependent: :destroy
    has_many :patients, through: :appointments
end
