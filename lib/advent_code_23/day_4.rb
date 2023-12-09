# frozen_string_literal: true

module AdventCode23
  class Day4
    def initialize(input:)
      @input = input
    end

    def run
      get_scores.reject { |elem| elem == 0 }.sum { |elem| 2**(elem - 1) }
    end

    def run_2
      scores =  get_scores
      results = Array.new(scores.length) { 1 }

      scores.each_with_index { |num, index| num.times { |n| results[index + n + 1] += results[index] } }
      results.sum
    end

    private

    def get_scores
      @input.each_line(chomp: true).map(&:strip).map do |line|
        split_line = line.split(/Card\s+\d+:/)[1].split("|")
        winning = split_line[0].scan(/\d+/).map(&:to_i)
        mine = split_line[1].scan(/\d+/).map(&:to_i)

        mine.filter { |card| winning.include? card }.length
      end
    end
  end
end
