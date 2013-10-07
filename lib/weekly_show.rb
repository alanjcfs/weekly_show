require 'active_support/time'
require 'action_view'

class WeeklyShow
  include ActionView::Context
  include ActionView::Helpers::TagHelper

  attr_reader :options

  def initialize(options={})
    default_options = {weeks_before: 3, weeks_ahead: 0}
    @options = default_options.merge(options)
  end

  def show_last_three_weeks
    this_week = Date.today.beginning_of_week(:sunday)
    past_week = this_week - 1.week
    second_past_week = past_week - 1.week

    content_tag(:table, id: "calendar", class: "table table-bordered table-condensed calendar") do
      content_tag(:thead, content_tag(:tr, names_of_calendar_day())) +
      content_tag(:tbody) do
        content_tag(:tr, class: "dayName") do # Two weeks ago
          content_tag(:td, month_name_to_show(second_past_week, true), scope: "col") +
          display_days_of_week(second_past_week)
        end +
        content_tag(:tr) do # One weeks ago
          content_tag(:td, month_name_to_show(past_week)) +
          display_days_of_week(past_week)
        end +
        content_tag(:tr) do # This week
          content_tag(:td, month_name_to_show(this_week)) +
          display_days_of_week(this_week)
        end
      end
    end
  end

  # Generate an empty cell for holding month's name, then 
  # Sunday through Saturday, plus one for holding a month name
  def names_of_calendar_day
    ['', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map do |day|
      content_tag(:th, day)
    end.join('').html_safe
  end

  # Add range 0 through 6 to generate list of days. Maybe there's a better way?
  def display_days_of_week(week)
    (0..6).map do |num|
      day_of_week = week + num.day
      content_tag(:td, "#{day_of_week.day} #{mark_today(day_of_week)}".try(:html_safe), class: classify_two_weeks(day_of_week))
    end.join('').html_safe
  end

  # Show the name of the month if the week argument passed has the first day of
  # the month, else use force_show to determine whether or not to show the month
  def month_name_to_show(week, force_show = false)
    # Return month if beginning of the week happens to be 1
    return week.strftime("%B") if week.day == 1

    week_range         = week..week.end_of_week(:sunday)
    day_one_next_month = week.end_of_month + 1.day

    this_month_name    = week.strftime("%B")
    next_month_name    = day_one_next_month.strftime("%B")

    return next_month_name if (week_range).cover?(day_one_next_month)

    return this_month_name if force_show

    ''
  end

  def classify_two_weeks(day)
    if (2.weeks.ago..Date.today).cover?(day)
      "two-weeks"
    else
      "not-two-weeks"
    end
  end

  def mark_today(day)
    content_tag(:span, "TODAY", class: "today") if day == Date.today
  end

  def show_weeks
    "table"
  end
end
