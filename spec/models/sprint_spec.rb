require 'rails_helper'

RSpec.describe Sprint, type: :model do
  before :all do
    @thursday, @friday, @saturday, @sunday, @monday =
      (17..21).map { |n| Date.new(2011,11,n) }

    @sprint = Sprint.new
  end

  context "next_weekday" do
    it "should find friday after thursday" do
      expect(@sprint.next_week_day(@thursday)).to eq @friday
    end
    it "should find monday after friday" do
      expect(@sprint.next_week_day(@friday)).to eq @monday
    end
  end
end
