class CreateMoleTests < ActiveRecord::Migration
  def change
    create_table :mole_tests do |t|
      t.integer :testnum

      t.timestamps null: false
    end
  end
end
