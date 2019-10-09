class Project < ApplicationRecord
  has_many :people, dependent: :destroy

  validates :title, presence: true
end
