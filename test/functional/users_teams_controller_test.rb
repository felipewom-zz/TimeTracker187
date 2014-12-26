require 'test_helper'

class UsersTeamsControllerTest < ActionController::TestCase
  setup do
    @users_team = users_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_team" do
    assert_difference('UsersTeam.count') do
      post :create, :users_team => { :team_id => @users_team.team_id, :user_id => @users_team.user_id }
    end

    assert_redirected_to users_team_path(assigns(:users_team))
  end

  test "should show users_team" do
    get :show, :id => @users_team
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @users_team
    assert_response :success
  end

  test "should update users_team" do
    put :update, :id => @users_team, :users_team => { :team_id => @users_team.team_id, :user_id => @users_team.user_id }
    assert_redirected_to users_team_path(assigns(:users_team))
  end

  test "should destroy users_team" do
    assert_difference('UsersTeam.count', -1) do
      delete :destroy, :id => @users_team
    end

    assert_redirected_to users_teams_path
  end
end
