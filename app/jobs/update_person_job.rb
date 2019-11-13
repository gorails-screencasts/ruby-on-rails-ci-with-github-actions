class UpdatePersonJob < ApplicationJob
  queue_as :default

  def perform(person_id, score)
    Person.find(person_id).update(score: score)
  end
end
