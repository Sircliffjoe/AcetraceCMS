require 'test_helper'

class MycasecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mycasecomment = mycasecomments(:one)
  end

  test "should get index" do
    get mycasecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_mycasecomment_url
    assert_response :success
  end

  test "should create mycasecomment" do
    assert_difference('Mycasecomment.count') do
      post mycasecomments_url, params: { mycasecomment: { content: @mycasecomment.content, mycase_id: @mycasecomment.mycase_id, user_id: @mycasecomment.user_id } }
    end

    assert_redirected_to mycasecomment_url(Mycasecomment.last)
  end

  test "should show mycasecomment" do
    get mycasecomment_url(@mycasecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_mycasecomment_url(@mycasecomment)
    assert_response :success
  end

  test "should update mycasecomment" do
    patch mycasecomment_url(@mycasecomment), params: { mycasecomment: { content: @mycasecomment.content, mycase_id: @mycasecomment.mycase_id, user_id: @mycasecomment.user_id } }
    assert_redirected_to mycasecomment_url(@mycasecomment)
  end

  test "should destroy mycasecomment" do
    assert_difference('Mycasecomment.count', -1) do
      delete mycasecomment_url(@mycasecomment)
    end

    assert_redirected_to mycasecomments_url
  end
end
