require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:regular)
  end

  test "redirected if not logged in" do
    sign_out :user
    get projects_url
    assert_response :redirect
  end

  test "can get index" do
    get projects_url
    assert_response :success
  end

  test "can get new" do
    get new_project_url
    assert_response :success
  end
end
