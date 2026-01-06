=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  def initialize(seconds)
    @seconds = seconds
  end

  def timer
    seconds = @seconds
    if seconds > 99
      minutes = seconds.div(100)
      seconds = seconds.to_s
      seconds = seconds.sub(minutes.to_s, '')
      seconds = (minutes.to_i * 60) + seconds.to_i
    end
    Time.at(seconds).strftime("%M:%S")
  end
end