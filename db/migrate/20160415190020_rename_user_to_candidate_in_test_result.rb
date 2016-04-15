class RenameUserToCandidateInTestResult < ActiveRecord::Migration
  def change
    rename_column :test_results, :user_id, :candidate_id
  end
end
