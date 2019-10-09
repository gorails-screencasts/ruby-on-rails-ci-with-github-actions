require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visit index" do
    sign_in users(:regular)
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "can create project" do
    sign_in users(:regular)
    visit projects_url

    click_on "Add New Project"
    fill_in "Title", with: "Hello Test"
    click_on "Create Project"

    assert_selector "h1", text: "Hello Test"
  end

  test "can update a project" do
    sign_in users(:regular)

    visit project_url(@project)
    click_on "Edit"
    fill_in "Title", with: "Hello Test"
    click_on "Update Project"

    assert_selector "h1", text: "Hello Test"
  end

  test "can delete a project" do
    sign_in users(:regular)

    visit project_url(@project)
    click_on "Edit"

    #page.accept_confirm do
      #click_on "Destroy"
    #end

    click_on "Destroy"
    click_on "Confirm"

    assert_selector "h1", text: "Projects"
  end

end
