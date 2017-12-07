require 'test_helper'

class MwoBuildsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mwo_build = mwo_builds(:one)
  end

  test "should get index" do
    get mwo_builds_url
    assert_response :success
  end

  test "should get new" do
    get new_mwo_build_url
    assert_response :success
  end

  test "should create mwo_build" do
    assert_difference('MwoBuild.count') do
      post mwo_builds_url, params: { mwo_build: { comments: @mwo_build.comments, mech: @mwo_build.mech, name: @mwo_build.name, url: @mwo_build.url, user_id: @mwo_build.user_id } }
    end

    assert_redirected_to mwo_build_url(MwoBuild.last)
  end

  test "should show mwo_build" do
    get mwo_build_url(@mwo_build)
    assert_response :success
  end

  test "should get edit" do
    get edit_mwo_build_url(@mwo_build)
    assert_response :success
  end

  test "should update mwo_build" do
    patch mwo_build_url(@mwo_build), params: { mwo_build: { comments: @mwo_build.comments, mech: @mwo_build.mech, name: @mwo_build.name, url: @mwo_build.url, user_id: @mwo_build.user_id } }
    assert_redirected_to mwo_build_url(@mwo_build)
  end

  test "should destroy mwo_build" do
    assert_difference('MwoBuild.count', -1) do
      delete mwo_build_url(@mwo_build)
    end

    assert_redirected_to mwo_builds_url
  end
end
