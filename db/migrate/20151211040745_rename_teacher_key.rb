class RenameTeacherKey < ActiveRecord::Migration
  def change
  	  	rename_column "courses", "teacher_id", "user_id"

  end
end
