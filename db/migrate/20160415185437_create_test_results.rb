class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.references :user, index: true, foreign_key: true
      t.references :mole_test, index: true, foreign_key: true
      t.datetime :started_at, null: false
      t.datetime :finished_at

      t.timestamps null: false
    end
  end
end
