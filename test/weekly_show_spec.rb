require 'minitest/autorun'

describe WeeklyShowSpec do
  before do
    weekly_show = WeeklyShow.new
  end

  it "is sane" do
    (2 + 2).must_equal 4
  end
end
