require 'test_helper'

class ShowcaseControllerTest < ActionDispatch::IntegrationTest
  test "should get school_showcase" do
    get showcase_school_showcase_url
    assert_response :success
  end

  test "should get student_showcase" do
    get showcase_student_showcase_url
    assert_response :success
  end

  test "should get teacher_showcase" do
    get showcase_teacher_showcase_url
    assert_response :success
  end

  test "should get vender_showcase" do
    get showcase_vender_showcase_url
    assert_response :success
  end

end
