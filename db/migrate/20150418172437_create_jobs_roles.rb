class CreateJobsRoles < ActiveRecord::Migration
  def change
    create_table :jobs_roles do |t|
      t.belongs_to :role
      t.belongs_to :job
    end
  end
end
