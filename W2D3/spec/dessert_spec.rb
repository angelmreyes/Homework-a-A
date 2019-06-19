require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cookie) { Dessert.new("cookie", 20, chef) }
  let(:chef) { double("chef", name: "Adrian") } #how does this name: work?

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cookie", "500", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cookie.ingredients).to_not include("flour")
      cookie.add_ingredient("flour")
      expect(cookie.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      i = ("a".."z").to_a
      i.each { |ele| cookie.add_ingredient(ele) }
      expect(cookie.ingredients).to eq(i)
      cookie.mix!
      expect(cookie.ingredients).not_to eq(i)
      expect(cookie.ingredients.sort).to eq(i.sort)
      #expect(cookie.ingredients).to receive(:shuffle!) no_args #? why not work?
    end
  end

  describe "#eat" do
    before(:each) { cookie.eat(5) }

    it "subtracts an amount from the quantity" do
      expect(cookie.quantity).to eq(15)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(25) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef Adrian the Great Baker") #difference between allow and expect?
      # expect(chef).to receive(:titleize).with(no_arg).and_return("Chef Adrian the Great Baker") #difference between allow and expect?
      # expect(cookie.type).to receive(:pluralize)
      # expect(cookie.serve).to include("Chef Adrian the Great Baker has made #{cookie.quantity} #{cookie.type.pluralize}!")
      # allow(chef).to receive(:titleize).and_return("Chef Adrian the Great Baker")
      expect(cookie.serve).to include("Chef Adrian the Great Baker has made 20 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
