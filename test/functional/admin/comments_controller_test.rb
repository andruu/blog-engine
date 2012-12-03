require 'test_helper'

class Admin::CommentsControllerTest < ActionController::TestCase
  setup do
    @admin_comment = admin_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_comment" do
    assert_difference('Admin::Comment.count') do
      post :create, admin_comment: {  }
    end

    assert_redirected_to admin_comment_path(assigns(:admin_comment))
  end

  test "should show admin_comment" do
    get :show, id: @admin_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_comment
    assert_response :success
  end

  test "should update admin_comment" do
    put :update, id: @admin_comment, admin_comment: {  }
    assert_redirected_to admin_comment_path(assigns(:admin_comment))
  end

  test "should destroy admin_comment" do
    assert_difference('Admin::Comment.count', -1) do
      delete :destroy, id: @admin_comment
    end

    assert_redirected_to admin_comments_path
  end
end
