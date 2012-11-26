require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  setup do
    @admin_page = admin_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_page" do
    assert_difference('Admin::Page.count') do
      post :create, admin_page: {  }
    end

    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  test "should show admin_page" do
    get :show, id: @admin_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_page
    assert_response :success
  end

  test "should update admin_page" do
    put :update, id: @admin_page, admin_page: {  }
    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  test "should destroy admin_page" do
    assert_difference('Admin::Page.count', -1) do
      delete :destroy, id: @admin_page
    end

    assert_redirected_to admin_pages_path
  end
end
