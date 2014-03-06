class StudentTeacherProfilesController < InheritedResources::Base

  before_filter :authenticate_user!, :except => [:show]

  def show
    @student_teacher_profile = StudentTeacherProfile.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_teacher_profile }
    end
  end

  # GET /hotels/1/edit
  def edit
    @student_teacher_profile = StudentTeacherProfile.find(params[:id])
  end

  # PUT /hotels/1
  # PUT /hotels/1.json
  def update
    @student_teacher_profile = StudentTeacherProfile.find(params[:id])
    respond_to do |format|
      if @student_teacher_profile.update_attributes(params[:student_teacher_profile])
        format.html { redirect_to @student_teacher_profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_teacher_profile.errors, status: :unprocessable_entity }
      end
    end
  end

end
