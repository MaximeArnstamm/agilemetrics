class Project < ActiveRecord::Base
  has_many :sprints

  def last_sprint
    sprints.order(:number).last
  end
end
