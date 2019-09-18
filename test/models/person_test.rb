require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "has no score by default" do
    person = people(:one)
    assert_nil person.score
  end
end
