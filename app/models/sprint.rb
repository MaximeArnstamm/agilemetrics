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
    sprint.startDate = next_week_day(self.endDate)
    sprint.endDate = sprint.startDate + 13

    sprint
  end

  def next_week_day(date)
    ndate = date + 1
    if ndate.wday == 6 # saturday
      ndate += 1
    end
    if ndate.wday == 0 # sunday
      ndate += 1
    end
    ndate
  end

end
