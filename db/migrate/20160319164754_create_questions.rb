class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :mole_test, index: true, foreign_key: true
      t.string :q
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
