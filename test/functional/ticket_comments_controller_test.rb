require 'test_helper'

class TicketCommentsControllerTest < ActionController::TestCase
  setup do
    @ticket_comment = ticket_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_comment" do
    assert_difference('TicketComment.count') do
      post :create, :ticket_comment => { :body => @ticket_comment.body, :ticket_id => @ticket_comment.ticket_id, :version_id => @ticket_comment.version_id }
    end

    assert_redirected_to ticket_comment_path(assigns(:ticket_comment))
  end

  test "should show ticket_comment" do
    get :show, :id => @ticket_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ticket_comment
    assert_response :success
  end

  test "should update ticket_comment" do
    put :update, :id => @ticket_comment, :ticket_comment => { :body => @ticket_comment.body, :ticket_id => @ticket_comment.ticket_id, :version_id => @ticket_comment.version_id }
    assert_redirected_to ticket_comment_path(assigns(:ticket_comment))
  end

  test "should destroy ticket_comment" do
    assert_difference('TicketComment.count', -1) do
      delete :destroy, :id => @ticket_comment
    end

    assert_redirected_to ticket_comments_path
  end
end
