require 'test_helper'

class UpdatePersonJobTest < ActiveJob::TestCase
  setup do
    @person = people(:one)
  end

  test "update score" do
    UpdatePersonJob.perform_now(@person.id, 9)
    assert_equal 9, @person.reload.score
  end
end
