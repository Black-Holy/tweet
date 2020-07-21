require 'test_helper'

class CarendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carendar = carendars(:one)
  end

  test "should get index" do
    get carendars_url
    assert_response :success
  end

  test "should get new" do
    get new_carendar_url
    assert_response :success
  end

  test "should create carendar" do
    assert_difference('Carendar.count') do
      post carendars_url, params: { carendar: { description: @carendar.description, end_date: @carendar.end_date, start_date: @carendar.start_date, title: @carendar.title } }
    end

    assert_redirected_to carendar_url(Carendar.last)
  end

  test "should show carendar" do
    get carendar_url(@carendar)
    assert_response :success
  end

  test "should get edit" do
    get edit_carendar_url(@carendar)
    assert_response :success
  end

  test "should update carendar" do
    patch carendar_url(@carendar), params: { carendar: { description: @carendar.description, end_date: @carendar.end_date, start_date: @carendar.start_date, title: @carendar.title } }
    assert_redirected_to carendar_url(@carendar)
  end

  test "should destroy carendar" do
    assert_difference('Carendar.count', -1) do
      delete carendar_url(@carendar)
    end

    assert_redirected_to carendars_url
  end
end
