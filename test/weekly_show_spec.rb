require 'minitest/autorun'

require 'weekly_show'

class WeeklyShowSpec < Minitest::Spec
  before do
    weekly_show = WeeklyShow.new
  end

  it "is sane" do
    (2 + 2).must_equal 4
  end

  it "uses ActiveSupport Time extensions" do
    1.must_respond_to :week
  end
end
