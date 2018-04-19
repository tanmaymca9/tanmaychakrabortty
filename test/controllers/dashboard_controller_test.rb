require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get schhol" do
    get dashboard_schhol_url
    assert_response :success
  end

  test "should get teacher" do
    get dashboard_teacher_url
    assert_response :success
  end

  test "should get student" do
    get dashboard_student_url
    assert_response :success
  end

  test "should get vendor" do
    get dashboard_vendor_url
    assert_response :success
  end

end
