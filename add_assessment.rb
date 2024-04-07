#Run ruby code with command "ruby filename.rb"
#At line no. 25 pass different string to check code with different argumnets

require 'rspec'

def add(numbers)
  begin
    raise "Input is nil" if numbers.nil?

    raise "Input is Invalid" unless numbers.is_a? String

    negative_numbers = numbers.split(",").map(&:to_i).select(&:negative?)
    if negative_numbers.any? 
      raise "Negative numbers not allowed #{negative_numbers.join(",")}"
    end

    input = numbers.split(/\D/)
    result = input.map(&:to_i).sum
    p "Output: #{result}"
  rescue StandardError => e
    p e.message
  end  
end

add("3, 5, 7")

# Rspec
# Need to run "gem install rspec" in local machine
# to execute test run  command "rspec algorithm.rb"
describe "add" do
  context "Addition for multiple numbers have been done successfully" do 
    it "Two numbers in string" do
      expect(add("3, 9")).to eq("Output: 12")
    end

    it "Single number in string" do
      expect(add("9")).to eq("Output: 9")
    end

    it "Blank string" do
      expect(add("")).to eq("Output: 0")
    end

    it "Handle new lines between numbers" do
      expect(add("1\n2,3")).to eq("Output: 6")
    end
  end

  context "Invalid input string" do 
    it "Nil as argumnet" do
      expect(add(nil)).to eq("Input is nil")
    end

    it "Check valid string" do
      expect(add(5)).to eq("Input is Invalid")
    end

    it "Negative number in string" do
      expect(add("1, 2, -8, 3, -4")).to eq("Negative numbers not allowed -8,-4")
    end
  end
end
