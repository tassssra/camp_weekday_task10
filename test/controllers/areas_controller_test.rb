require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get areas_index_url
    assert_response :success
  end

  test "should get search" do
    get areas_search_url
    assert_response :success
  end

  test "should get create" do
    get areas_create_url
    assert_response :success
  end

end
