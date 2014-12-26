require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, :ticket => { :actual_time => @ticket.actual_time, :assignee_id => @ticket.assignee_id, :billable => @ticket.billable, :budget_progress => @ticket.budget_progress, :description => @ticket.description, :end_date => @ticket.end_date, :estimated_time => @ticket.estimated_time, :name => @ticket.name, :project_id => @ticket.project_id, :start_date => @ticket.start_date, :status_id => @ticket.status_id, :ticket_category_id => @ticket.ticket_category_id, :ticket_priority_id => @ticket.ticket_priority_id }
    end

    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should show ticket" do
    get :show, :id => @ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ticket
    assert_response :success
  end

  test "should update ticket" do
    put :update, :id => @ticket, :ticket => { :actual_time => @ticket.actual_time, :assignee_id => @ticket.assignee_id, :billable => @ticket.billable, :budget_progress => @ticket.budget_progress, :description => @ticket.description, :end_date => @ticket.end_date, :estimated_time => @ticket.estimated_time, :name => @ticket.name, :project_id => @ticket.project_id, :start_date => @ticket.start_date, :status_id => @ticket.status_id, :ticket_category_id => @ticket.ticket_category_id, :ticket_priority_id => @ticket.ticket_priority_id }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, :id => @ticket
    end

    assert_redirected_to tickets_path
  end
end
