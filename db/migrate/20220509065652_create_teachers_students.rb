class CreateTeachersStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers_students, id: false do |t|
      t.references :teacher, index: true, null: false
      t.references :student, index: true, null: false

      t.timestamps
    end
  end
end
