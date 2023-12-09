# frozen_string_literal: true

require "advent_code_23/day_3"

INPUT = '467..114..
         ...*......
         ..35..633.
         ......#...
         617*......
         .....+.58.
         ..592.....
         ......755.
         ...$.*....
         .664.598..'

RSpec.describe AdventCode23::Day3 do
  subject { AdventCode23::Day3 }

  context "part1" do
    it "example" do
      result = subject.new(input: INPUT).run

      expect(result).to be(4361)
    end

    it "real input" do
      result = subject.new(input: File.read("data/3.txt")).run
      expect(result).to be(549_908)
    end
  end
  context "part2" do
    it "example" do
      result = subject.new(input: INPUT).run_2

      expect(result).to be(467_835)
    end

    it "real input" do
      result = subject.new(input: File.read("data/3.txt")).run_2
      expect(result).to be(81_166_799)
    end
  end
end
