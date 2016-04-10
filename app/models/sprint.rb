class Sprint < ActiveRecord::Base
  belongs_to :project

  def next_sprint
    sprint = Sprint.new
    sprint.number = self.number + 1
    sprint.startDate = self.endDate + 1
    sprint.endDate = sprint.startDate + 13

    sprint
  end
end
