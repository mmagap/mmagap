class CreateStudentTeacherProfiles < ActiveRecord::Migration
  def change
    create_table :student_teacher_profiles do |t|
      t.integer :user_id
      t.string :to_learn,            :default => "", :null => false
      t.string :on_leant_amount,     :default => "", :null => false
      t.string :to_teach,            :default => "", :null => false
      t.string :for_teaching_amount, :default => "", :null => false

      t.timestamps
    end
    add_index :student_teacher_profiles, :user_id
  end
end
