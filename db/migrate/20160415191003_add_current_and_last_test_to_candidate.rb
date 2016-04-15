class AddCurrentAndLastTestToCandidate < ActiveRecord::Migration
  def change
    change_table :candidates do |t|
      t.references :current_test, class_name: :mole_test
      t.references :last_test, class_name: :mole_test
    end
  end
end
