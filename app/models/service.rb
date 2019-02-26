class Service < ApplicationRecord
  belongs_to :institution
  belongs_to :doctor
end
