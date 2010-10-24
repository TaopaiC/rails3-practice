require 'spec_helper'

describe Post do
  describe "validator" do
    before :each do
      @params = {
        :forum_id => 3,
        :title  => Faker::Lorem.sentence,
        :description => Faker::Lorem.sentence
      }
    end

    it "should be valid with valid attributes" do
      Post.new(@params).should be_valid
    end

    it "should not be valid without a title" do
      Post.new(@params.except(:title)).should_not be_valid
    end

    it "should not be valid without a description" do
      Post.new(@params.except(:description)).should_not be_valid
    end
  end
end
