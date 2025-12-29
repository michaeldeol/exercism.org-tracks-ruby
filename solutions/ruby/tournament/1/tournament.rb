=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

module Tournament
  @@teams = {}
  def self.tally(input)
    @@teams = {}
    self.process_score(input)
    self.process_board
  end

  def self.process_board
    scores = {}
    @@teams.each do |name, team|
      scores[name] = team.p
    end
  
    sorted_scores = scores.sort_by { |key, value| [-value, key] }.to_h
    
    board = "Team                           | MP |  W |  D |  L |  P\n"
  
    sorted_scores.each do |k, v|
      team_data = @@teams[k].to_h
    
      name = team_data[:name].to_s.ljust(31)
      mp = team_data[:mp].to_s.rjust(2)
      w = team_data[:w].to_s.rjust(2)
      d = team_data[:d].to_s.rjust(2)
      l = team_data[:l].to_s.rjust(2)
      p = team_data[:p].to_s.rjust(2)
    
      board += "#{name}| #{mp} | #{w} | #{d} | #{l} | #{p}\n"
    end
  
    return board
  end
  
  def self.process_score(input)
    games = input.split("\n")
    games.each do |game|
      data = game.split(';')
      team_1_name = data[0]
      team_2_name = data[1]
      score = data[2]
    
      if !@@teams[team_1_name]
        @@teams[team_1_name] = Team.new(team_1_name)
      end
      if !@@teams[team_2_name]
        @@teams[team_2_name] = Team.new(team_2_name)
      end
    
      case score
      when 'win'
        @@teams[team_2_name].process_score('loss')
      when 'loss'
        @@teams[team_2_name].process_score('win')
      when 'draw'
        @@teams[team_2_name].process_score('draw')
      end
      @@teams[team_1_name].process_score(score)
    end
  end
end

class Team
  attr_reader :name, :mp, :w, :d, :l, :p
  
  def initialize(name)
    @name = name
    @mp = 0
    @w = 0
    @d = 0
    @l = 0
    @p = 0
  end

  def process_score(score)
    process_win_loss(score)
    process_match
    process_points
  end

  def to_h
    { name: @name, mp: @mp, w: @w, d: @d, l: @l, p: @p }
  end

  private
  
  def process_win_loss(score)
    case score
    when 'win'
      @w += 1
    when 'draw'
      @d += 1
    when 'loss'
      @l += 1
    end
  end

  def process_match
    @mp += 1
  end

  def process_points
    @p = (@w * 3) + @d
  end
end