class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.references :teacher, null: false, foreign_key: true
      t.string :subject

      t.timestamps
    end
  end
end
