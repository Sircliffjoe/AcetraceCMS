require 'test_helper'

class MycasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mycase = mycases(:one)
  end

  test "should get index" do
    get mycases_url
    assert_response :success
  end

  test "should get new" do
    get new_mycase_url
    assert_response :success
  end

  test "should create mycase" do
    assert_difference('Mycase.count') do
      post mycases_url, params: { mycase: { add_court: @mycase.add_court, add_judge: @mycase.add_judge, area_of_practice: @mycase.area_of_practice, arrival_date: @mycase.arrival_date, assigned_attorney: @mycase.assigned_attorney, caseNo: @mycase.caseNo, client_name: @mycase.client_name, due_date: @mycase.due_date, opponents: @mycase.opponents, status: @mycase.status, subject: @mycase.subject, summary_of_brief: @mycase.summary_of_brief, user_id: @mycase.user_id } }
    end

    assert_redirected_to mycase_url(Mycase.last)
  end

  test "should show mycase" do
    get mycase_url(@mycase)
    assert_response :success
  end

  test "should get edit" do
    get edit_mycase_url(@mycase)
    assert_response :success
  end

  test "should update mycase" do
    patch mycase_url(@mycase), params: { mycase: { add_court: @mycase.add_court, add_judge: @mycase.add_judge, area_of_practice: @mycase.area_of_practice, arrival_date: @mycase.arrival_date, assigned_attorney: @mycase.assigned_attorney, caseNo: @mycase.caseNo, client_name: @mycase.client_name, due_date: @mycase.due_date, opponents: @mycase.opponents, status: @mycase.status, subject: @mycase.subject, summary_of_brief: @mycase.summary_of_brief, user_id: @mycase.user_id } }
    assert_redirected_to mycase_url(@mycase)
  end

  test "should destroy mycase" do
    assert_difference('Mycase.count', -1) do
      delete mycase_url(@mycase)
    end

    assert_redirected_to mycases_url
  end
end
