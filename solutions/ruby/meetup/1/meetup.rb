=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end

require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @first_day = Date.new(year, month, 1)
    @target_wday = {
      sunday: 0,
      monday: 1,
      tuesday: 2,
      wednesday: 3,
      thursday: 4,
      friday: 5,
      saturday: 6
    }
  end

  def day(dow, value)
    target = @target_wday[dow]
    days_until_target = (target - @first_day.wday) % 7
    first_occurence = @first_day + days_until_target

    case value
    when :first
      first_occurence
    when :second
      first_occurence + 7
    when :third
      first_occurence + 14
    when :fourth
      first_occurence + 21
    when :teenth
      candidate = first_occurence
      candidate += 7 while candidate.day < 13
      candidate
    when :last
      last_occurence = first_occurence + 28
      last_occurence = last_occurence - 7 if last_occurence.month != @month
      last_occurence
    end
  end
end