class CreateQuestions < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:question_name, :string)
      t.column(:survey_id, :int)
    end
  end
end
