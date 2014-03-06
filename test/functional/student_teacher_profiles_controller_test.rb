require 'test_helper'

class StudentTeacherProfilesControllerTest < ActionController::TestCase
  setup do
    @student_teacher_profile = student_teacher_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_teacher_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_teacher_profile" do
    assert_difference('StudentTeacherProfile.count') do
      post :create, student_teacher_profile: { for_teaching_amount: @student_teacher_profile.for_teaching_amount, on_leant_amount: @student_teacher_profile.on_leant_amount, to_learn: @student_teacher_profile.to_learn, to_teach: @student_teacher_profile.to_teach, user_id: @student_teacher_profile.user_id }
    end

    assert_redirected_to student_teacher_profile_path(assigns(:student_teacher_profile))
  end

  test "should show student_teacher_profile" do
    get :show, id: @student_teacher_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_teacher_profile
    assert_response :success
  end

  test "should update student_teacher_profile" do
    put :update, id: @student_teacher_profile, student_teacher_profile: { for_teaching_amount: @student_teacher_profile.for_teaching_amount, on_leant_amount: @student_teacher_profile.on_leant_amount, to_learn: @student_teacher_profile.to_learn, to_teach: @student_teacher_profile.to_teach, user_id: @student_teacher_profile.user_id }
    assert_redirected_to student_teacher_profile_path(assigns(:student_teacher_profile))
  end

  test "should destroy student_teacher_profile" do
    assert_difference('StudentTeacherProfile.count', -1) do
      delete :destroy, id: @student_teacher_profile
    end

    assert_redirected_to student_teacher_profiles_path
  end
end
