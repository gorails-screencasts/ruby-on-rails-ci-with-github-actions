require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has first name" do
    assert_equal "Chris", users(:regular).first_name
  end

  test "can update first name" do
    users(:regular).update(first_name: "Regular")
    assert_equal "Regular", users(:regular).first_name
  end
end
