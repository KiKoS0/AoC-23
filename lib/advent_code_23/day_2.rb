# frozen_string_literal: true

module AdventCode23
  class Day2
    def initialize(input:)
      @input = input
    end

    def run
      expected_balls = { "red": 12, "green": 13, "blue": 14 }

      process_lines(@input) do |line|
        game = line.match(/Game (\d+):/)[1].to_i
        game_possible?(line, expected_balls) ? game : 0
      end.sum
    end

    def run_2
      process_lines(@input) do |line|
        minimums = minimums(line)
        minimums.values.reduce(:*)
      end.sum
    end

    private

    def process_lines(input, &block)
      input.each_line(chomp: true).map(&:strip).map(&block)
    end

    def game_possible?(line, expected_balls)
      line.scan(/(\d+)\s(blue|green|red)/).all? do |ball|
        ball[0].to_i <= expected_balls[ball[1].to_sym]
      end
    end

    def minimums(line)
      line.scan(/(\d+)\s(blue|green|red)/).each_with_object({ "red": 0, "green": 0, "blue": 0 }) do |ball, acc|
        color = ball[1].to_sym
        drawn = ball[0].to_i
        acc[color] = [acc[color], drawn].max
      end
    end
  end
end
