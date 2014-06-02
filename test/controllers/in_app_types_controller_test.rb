require 'test_helper'

class InAppTypesControllerTest < ActionController::TestCase
  setup do
    @in_app_type = in_app_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_app_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_app_type" do
    assert_difference('InAppType.count') do
      post :create, in_app_type: { apple_bundle_id: @in_app_type.apple_bundle_id, apple_id: @in_app_type.apple_id, apple_type: @in_app_type.apple_type, description: @in_app_type.description, display_name: @in_app_type.display_name, in_app_type: @in_app_type.in_app_type, price: @in_app_type.price }
    end

    assert_redirected_to in_app_type_path(assigns(:in_app_type))
  end

  test "should show in_app_type" do
    get :show, id: @in_app_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_app_type
    assert_response :success
  end

  test "should update in_app_type" do
    patch :update, id: @in_app_type, in_app_type: { apple_bundle_id: @in_app_type.apple_bundle_id, apple_id: @in_app_type.apple_id, apple_type: @in_app_type.apple_type, description: @in_app_type.description, display_name: @in_app_type.display_name, in_app_type: @in_app_type.in_app_type, price: @in_app_type.price }
    assert_redirected_to in_app_type_path(assigns(:in_app_type))
  end

  test "should destroy in_app_type" do
    assert_difference('InAppType.count', -1) do
      delete :destroy, id: @in_app_type
    end

    assert_redirected_to in_app_types_path
  end
end
