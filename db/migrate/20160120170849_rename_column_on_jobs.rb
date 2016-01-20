class RenameColumnOnJobs < ActiveRecord::Migration
  def change
  	rename_column(:jobs, :employer_id, :user_id)
  end
end
