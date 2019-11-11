require 'test_helper'

class Admin::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_artists_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_artists_edit_url
    assert_response :success
  end

end
