require 'test_helper'

class Admin::MenusControllerTest < ActionController::TestCase
  setup do
    @admin_menu = admin_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_menu" do
    assert_difference('Admin::Menu.count') do
      post :create, admin_menu: {  }
    end

    assert_redirected_to admin_menu_path(assigns(:admin_menu))
  end

  test "should show admin_menu" do
    get :show, id: @admin_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_menu
    assert_response :success
  end

  test "should update admin_menu" do
    put :update, id: @admin_menu, admin_menu: {  }
    assert_redirected_to admin_menu_path(assigns(:admin_menu))
  end

  test "should destroy admin_menu" do
    assert_difference('Admin::Menu.count', -1) do
      delete :destroy, id: @admin_menu
    end

    assert_redirected_to admin_menus_path
  end
end
