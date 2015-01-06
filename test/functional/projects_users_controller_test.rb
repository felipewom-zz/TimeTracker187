require 'test_helper'

class ProjectsUsersControllerTest < ActionController::TestCase
  setup do
    @projects_user = members_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create members_project" do
    assert_difference('MembersProject.count') do
      post :create, :projects_user => { :project_id => @projects_user.project_id, :user_id => @projects_user.user_id }
    end

    assert_redirected_to members_project_path(assigns(:projects_user))
  end

  test "should show members_project" do
    get :show, :id => @projects_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @projects_user
    assert_response :success
  end

  test "should update members_project" do
    put :update, :id => @projects_user, :projects_user => { :project_id => @projects_user.project_id, :user_id => @projects_user.user_id }
    assert_redirected_to members_project_path(assigns(:projects_user))
  end

  test "should destroy members_project" do
    assert_difference('MembersProject.count', -1) do
      delete :destroy, :id => @projects_user
    end

    assert_redirected_to members_projects_path
  end
end
