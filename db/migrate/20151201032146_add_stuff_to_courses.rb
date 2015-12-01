class AddStuffToCourses < ActiveRecord::Migration
  def change
   	add_column "courses", "start_date", :date
  	add_column "courses", "end_date", :date
  	add_column "courses", "course_times", :string
  	add_column "courses", "teacher_id", :integer
  	add_column "courses", "price", :decimal, :precision => 8, :scale => 2
  	add_column "courses", "description", :text

  	add_column "courses", "address_line1", :string
    add_column "courses", "address_line2", :string
  	add_column "courses", "city", :string
  	add_column "courses", "state", :string
  	add_column "courses", "zip", :string

  end
end
