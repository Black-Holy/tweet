require "application_system_test_case"

class CarendarsTest < ApplicationSystemTestCase
  setup do
    @carendar = carendars(:one)
  end

  test "visiting the index" do
    visit carendars_url
    assert_selector "h1", text: "Carendars"
  end

  test "creating a Carendar" do
    visit carendars_url
    click_on "New Carendar"

    fill_in "Description", with: @carendar.description
    fill_in "End date", with: @carendar.end_date
    fill_in "Start date", with: @carendar.start_date
    fill_in "Title", with: @carendar.title
    click_on "Create Carendar"

    assert_text "Carendar was successfully created"
    click_on "Back"
  end

  test "updating a Carendar" do
    visit carendars_url
    click_on "Edit", match: :first

    fill_in "Description", with: @carendar.description
    fill_in "End date", with: @carendar.end_date
    fill_in "Start date", with: @carendar.start_date
    fill_in "Title", with: @carendar.title
    click_on "Update Carendar"

    assert_text "Carendar was successfully updated"
    click_on "Back"
  end

  test "destroying a Carendar" do
    visit carendars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carendar was successfully destroyed"
  end
end
