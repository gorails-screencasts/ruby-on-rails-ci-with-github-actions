class Project < ApplicationRecord
  has_many :people, dependent: :destroy
end
