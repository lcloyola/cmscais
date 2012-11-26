require 'test_helper'

class SubunitsControllerTest < ActionController::TestCase
  setup do
    @subunit = subunits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subunits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subunit" do
    assert_difference('Subunit.count') do
      post :create, subunit: { relationship: @subunit.relationship, remarks: @subunit.remarks }
    end

    assert_redirected_to subunit_path(assigns(:subunit))
  end

  test "should show subunit" do
    get :show, id: @subunit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subunit
    assert_response :success
  end

  test "should update subunit" do
    put :update, id: @subunit, subunit: { relationship: @subunit.relationship, remarks: @subunit.remarks }
    assert_redirected_to subunit_path(assigns(:subunit))
  end

  test "should destroy subunit" do
    assert_difference('Subunit.count', -1) do
      delete :destroy, id: @subunit
    end

    assert_redirected_to subunits_path
  end
end
