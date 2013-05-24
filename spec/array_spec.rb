require 'rspec'
require 'array.rb'

describe Array do
  describe "#my_uniq" do
    it "removes duplicates from itself" do
      [1, 2, 1, 3, 3].my_uniq.should == [1, 2, 3]
    end

    it "doesn't affect already unique arrays" do
      [1,2,3].my_uniq.should == [1, 2, 3]
    end
  end

  describe "#two_sum" do
    it "identifies indexes of zero-sum pairs" do
      [1, -1, 2, -2].two_sum.should == [[0,1], [2,3]]
    end

    it "returns indices in order" do
      [4 , -2 , 3 , 2, 2].two_sum.should == [[1,3], [1,4]]
    end
  end

  describe "#my_transpose" do
    it "turns rows to cols" do
      rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]]

      cols = [
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]]
      rows.my_transpose.should == cols
    end

    it "turns cols to rows" do
      rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]]

      cols = [
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]]

      cols.my_transpose.should == rows
    end
  end

end

describe Tower do
  subject(:tower) {Tower.new(3)}

  describe "#towers" do
    it "lets us change towers with an attr_accessor" do
      tower.towers = [[3],[], [2,1]]
      tower.towers.should == [[3],[], [2,1]]
    end
  end

  describe "#render" do
    it "renders our new towers, array A with three discs at first" do
      tower.render.should == [[3, 2, 1], [], []]
    end
  end

  describe "#move" do
    it "moves a disc from one tower to another" do
      tower.move(0,1)
      tower.render.should == [[3, 2], [1], []]
    end

    it "does not move disc if origin disc greater than destination disc" do
      tower.towers = [[3, 2], [1], []]
      expect { tower.move(0, 1) }.to raise_error(ArgumentError)
    end

    it "cannot move from an empty tower" do
      tower.towers = [[3, 2], [1], []]
      expect { tower.move(2, 1) }.to raise_error(ArgumentError)
    end

  end

  describe "#won?" do
    it "declares winner with middle towers" do
      tower.towers = [[], [3,2,1], []]
      tower.won?.should == true
    end

    it "declares winner with end towers" do
       tower.towers = [[], [], [3,2,1]]
       tower.won?.should == true
    end

    it "doesn't declare winner when game isn't over" do
       tower.towers = [[], [1], [3,2]]
       tower.won?.should == false
    end

  end
end


describe "#stock_picker" do
  it "finds day high day low" do
    stock_picker([23,11,34,2,0,50,11]).should == [4,5]
  end

  it "doesn't sell before it buys" do
    stock_picker([23,11,34,2,50,0,11]).should == [3,4]
  end

end
