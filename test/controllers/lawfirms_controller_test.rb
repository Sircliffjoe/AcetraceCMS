require 'test_helper'

class LawfirmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lawfirm = lawfirms(:one)
  end

  test "should get index" do
    get lawfirms_url
    assert_response :success
  end

  test "should get new" do
    get new_lawfirm_url
    assert_response :success
  end

  test "should create lawfirm" do
    assert_difference('Lawfirm.count') do
      post lawfirms_url, params: { lawfirm: { address: @lawfirm.address, city: @lawfirm.city, email: @lawfirm.email, name: @lawfirm.name, phone_number: @lawfirm.phone_number, state: @lawfirm.state, type_of_organization: @lawfirm.type_of_organization } }
    end

    assert_redirected_to lawfirm_url(Lawfirm.last)
  end

  test "should show lawfirm" do
    get lawfirm_url(@lawfirm)
    assert_response :success
  end

  test "should get edit" do
    get edit_lawfirm_url(@lawfirm)
    assert_response :success
  end

  test "should update lawfirm" do
    patch lawfirm_url(@lawfirm), params: { lawfirm: { address: @lawfirm.address, city: @lawfirm.city, email: @lawfirm.email, name: @lawfirm.name, phone_number: @lawfirm.phone_number, state: @lawfirm.state, type_of_organization: @lawfirm.type_of_organization } }
    assert_redirected_to lawfirm_url(@lawfirm)
  end

  test "should destroy lawfirm" do
    assert_difference('Lawfirm.count', -1) do
      delete lawfirm_url(@lawfirm)
    end

    assert_redirected_to lawfirms_url
  end
end
