class Sprint < ActiveRecord::Base
  belongs_to :project
  validates :number, presence: true
  validates :startDate, presence: true
  validates :endDate, presence: true
  validates :velocityForecast, presence: true
  validates :velocityReal, presence: true
  validates :internalBugs, presence: true
  validates :externalBugs, presence: true
  validates :teamSatisfaction, presence: true
  validates :clientSatisfaction, presence: true

  def next_sprint
    sprint = Sprint.new
    sprint.number = self.number + 1
    sprint.startDate = self.endDate + 1
    sprint.endDate = sprint.startDate + 13

    sprint
  end
end
