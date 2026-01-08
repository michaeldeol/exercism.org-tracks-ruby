=begin
Write your code for the 'Yacht' exercise in this file. Make the tests in
`yacht_test.rb` pass.
To get started with TDD, see the `README.md` file in your
`ruby/yacht` directory.
=end

class Yacht
  def initialize(dice, category)
    @dice = dice
    @category = category
  end

  def score
    score = 0
    case @category
    when 'ones'
      found = @dice.keep_if { |die| die == 1 }
      return score + found.sum
    when 'twos'
      found = @dice.keep_if { |die| die == 2 }
      return score + found.sum
    when 'threes'
      found = @dice.keep_if { |die| die == 3 }
      return score + found.sum
    when 'fours'
      found = @dice.keep_if { |die| die == 4 }
      return score + found.sum
    when 'fives'
      found = @dice.keep_if { |die| die == 5 }
      return score + found.sum
    when 'sixes'
      found = @dice.keep_if { |die| die == 6 }
      return score + found.sum
    when 'full house'
      unique = @dice.uniq
      return score if unique.count == 1 || unique.count == 3
      first_set = @dice.select { |die| die == unique[0] }
      second_set = @dice.select { |die | die == unique[1] }
      return score if first_set.count == 1 || second_set.count == 1
      return score += @dice.sum
    when 'four of a kind'
      unique = @dice.uniq
      first_set = @dice.select { |die| die == unique[0] }
      second_set = @dice.select { |die| die == unique[1] }
      if first_set.count == 4 || first_set.count == 5
        first_set = first_set.drop(1) if first_set.count == 5
        return score += first_set.sum
      end
      if second_set.count == 4 || second_set.count == 5
        second_set = second_set.drop(1) if second_set.count == 5
        return score += second_set.sum
      end
      return score
    when 'little straight'
      if @dice.sort == [1, 2, 3, 4, 5]
        score += 30
      end
      return score
    when 'big straight'
      if @dice.sort == [2, 3, 4, 5, 6]
        score += 30
      end
      return score
    when 'choice'
      return @dice.sum
    when 'yacht'
      first_die = @dice[0]
      @dice.each do |die| 
        if die != first_die
          return score
        end
      end
      return score += 50
    end
  end
end