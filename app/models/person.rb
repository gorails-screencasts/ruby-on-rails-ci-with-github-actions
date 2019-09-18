class Person < ApplicationRecord
  belongs_to :project
  has_many :ratings
end
