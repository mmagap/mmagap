require 'spec_helper'

describe User do
  before do 
    @user = User.create! email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar'
    @user.reload
  end
  it 'should have blank studen/teacher ptofile when created' do
    @user.student_teacher_profile.for_teaching_amount.should be_a_kind_of(String)
    @user.student_teacher_profile.on_leant_amount.should be_a_kind_of(String)
    @user.student_teacher_profile.to_learn.should be_a_kind_of(String)
    @user.student_teacher_profile.to_teach.should be_a_kind_of(String)
  end
end