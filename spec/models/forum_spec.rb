require 'spec_helper'

describe Forum do
  describe "validator" do
    before :each do
      @params = {
        :title  => Faker::Lorem.sentence
      }
    end

    it "should be valid with valid attributes" do
      Forum.new(@params).should be_valid
    end

    it "should not be valid without a title" do
      Forum.new(@params.except(:title)).should_not be_valid
    end
  end
end
