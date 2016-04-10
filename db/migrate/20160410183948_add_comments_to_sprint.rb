class AddCommentsToSprint < ActiveRecord::Migration
  def change
    add_column :sprints, :velocityComment, :string
    add_column :sprints, :bugsComment, :string
    add_column :sprints, :satisfactionComment, :string
    add_column :sprints, :additionalNotes, :string
  end
end
