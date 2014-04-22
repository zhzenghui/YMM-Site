require 'test_helper'

class AblumsControllerTest < ActionController::TestCase
  setup do
    @ablum = ablums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ablums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ablum" do
    assert_difference('Ablum.count') do
      post :create, ablum: { free: @ablum.free, publish: @ablum.publish, text: @ablum.text, title: @ablum.title, url: @ablum.url, user_id: @ablum.user_id }
    end

    assert_redirected_to ablum_path(assigns(:ablum))
  end

  test "should show ablum" do
    get :show, id: @ablum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ablum
    assert_response :success
  end

  test "should update ablum" do
    patch :update, id: @ablum, ablum: { free: @ablum.free, publish: @ablum.publish, text: @ablum.text, title: @ablum.title, url: @ablum.url, user_id: @ablum.user_id }
    assert_redirected_to ablum_path(assigns(:ablum))
  end

  test "should destroy ablum" do
    assert_difference('Ablum.count', -1) do
      delete :destroy, id: @ablum
    end

    assert_redirected_to ablums_path
  end
end
