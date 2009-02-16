require File.dirname(__FILE__) + '/spec_helper'

class Chicken < ActiveRecord::Base
end

describe Chicken do

  describe "if ActiveRecord::Base.record_timestamps is false" do

    before do
      ActiveRecord::Base.record_timestamps = false
      @last_week = 1.week.ago
      @chicken = Chicken.create(:name => "Gertrude")
    end

    it "without skip_stamp, should not update timestamp" do
      @chicken.update_attribute :updated_at, @last_week
      @chicken.updated_at.should == @last_week
    end

    it "with skip_stamp, should not update timestamp" do
      @chicken.skip_stamp do
        @chicken.update_attribute :updated_at, @last_week
      end
      @chicken.updated_at.should == @last_week
    end

  end

  describe "if ActiveRecord::Base.record_timestamps is true" do

    before do
      ActiveRecord::Base.record_timestamps = true
      @last_week = 1.week.ago
      @chicken = Chicken.create(:name => "Joan")
    end

    it "without skip_stamp, should update timestamp" do
      @chicken.update_attribute :updated_at, @last_week
      @chicken.updated_at.should_not == @last_week
    end

    it "with skip_stamp, should not update timestamp" do
      @chicken.skip_stamp do
        @chicken.update_attribute :updated_at, @last_week
      end
      @chicken.updated_at.should == @last_week
    end

  end

  describe "if Chicken.record_timestamps is false" do

    before do
      Chicken.record_timestamps = false
      @last_week = 1.week.ago
      @chicken = Chicken.create(:name => "Leslea")
    end

    it "without skip_stamp, should not update timestamp" do
      @chicken.update_attribute :updated_at, @last_week
      @chicken.updated_at.should == @last_week
    end

    it "with skip_stamp, should not update timestamp" do
      @chicken.skip_stamp do
        @chicken.update_attribute :updated_at, @last_week
      end
      @chicken.updated_at.should == @last_week
    end

  end

  describe "if Chicken.record_timestamps is true" do

    before do
      Chicken.record_timestamps = true
      @last_week = 1.week.ago
      @chicken = Chicken.create(:name => "Amber")
    end

    it "without skip_stamp, should update timestamp" do
      @chicken.update_attribute :updated_at, @last_week
      @chicken.updated_at.should_not == @last_week
    end

    it "with skip_stamp, should not update timestamp" do
      @chicken.skip_stamp do
        @chicken.update_attribute :updated_at, @last_week
      end
      @chicken.updated_at.should == @last_week
    end

  end

end