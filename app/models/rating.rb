class Rating < ApplicationRecord
  belongs_to :person

  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  def promoter?
    score >= 9 && score <= 10
  end

  def passive?
    score >= 7 && score <= 8
  end

  def detractor?
    score <= 6 && score >= 0
  end
end
