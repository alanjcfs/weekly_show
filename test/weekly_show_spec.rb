require 'minitest/autorun'

require 'weekly_show'

class WeeklyShowSpec < Minitest::Spec
  before do
    weekly_show = WeeklyShow.new
  end

  it "is sane" do
    (2 + 2).must_equal 4
  end

  it "uses ActiveSupport extensions" do
    1.must_respond_to :week
  end

  it "can add time to date" do
    (Date.parse("2012-09-18") + 1.year).must_equal Date.parse("2013-09-18")
  end
end
