require "rspec"
require File.expand_path(File.dirname(__FILE__) + '/../../src/tennis_scorer.rb')


describe "TennisScorer", "basic scoring" do

  it "should start with a score of 0-0" do
    ts = TennisScorer.new
    ts.score.should == "0-0"
  end


  it "should be 15-0 if the server wins a point" do
    ts = TennisScorer.new
    ts.Server_scoring
    ts.score.should == "XV-0"
  end


  it "should be 0-15 if the receiver wins a point"do
    ts = TennisScorer.new
    ts.Receiver_scoring
    ts.score.should == "0-XV"
  end


  it "should be 15-15 after they both win a point"  do
    ts = TennisScorer.new
    ts.Server_scoring
    ts.Receiver_scoring
    ts.score.should == "XV-XV"
  end

    it "should be 40-30"  do
    ts = TennisScorer.new
    ts.Server_scoring
     ts.Server_scoring
     ts.Server_scoring
    ts.Receiver_scoring
    ts.Receiver_scoring
    ts.score.should == "XL-XXX"
  end

  it "should receiver win" do
     ts = TennisScorer.new
     # 0-0
     ts.Server_scoring
     ts.Server_scoring
     ts.Server_scoring
      #40-0
     ts.Receiver_scoring
     ts.Receiver_scoring
      ts.Receiver_scoring
       #40-40
      ts.Server_scoring
      #45-40
      ts.Receiver_scoring
       #40-40
      ts.Server_scoring
       #45-40
      ts.Receiver_scoring
        #40-40
      ts.Receiver_scoring
       #40-45
      ts.Receiver_scoring
        #receiver win

      ts.score.should == "0-0"
      ts.winner.should == "receiver win"

end


end
