class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :login, :null => false
      t.string :display_name, :null => false

      t.timestamps null: false
    end
  end
end
