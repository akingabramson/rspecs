require 'rspec'
require 'tree.rb'

describe TreeNode do

  describe "#initialize" do
    it "sets a value" do
      node8 = TreeNode.new(8)
      #node8.parent.should == node1.value
    end

    it "sets a value and an optional parent" do
      node8 = TreeNode.new(8)
      node7 = TreeNode.new(7)
    end

  end

  context "with a bunch of nodes" do

    let!(:node) {TreeNode.new(1)}
    let!(:node2) {TreeNode.new(2)}
    let!(:node3) {TreeNode.new(3)}
    let!(:node4) {TreeNode.new(4)}
    let!(:node5) {TreeNode.new(5)}
    let!(:node6) {TreeNode.new(6)}

    before(:each) do
      node.set_child(node2)
      node.set_child(node3)
      node3.set_child(node6)
      node2.set_child(node5)
    end

    describe "#value" do
      it "gets a value" do
        node.value.should == 1
      end
    end

    describe "#parent" do
      it "gets the parent of a node" do
        node2.set_child(node5)
        node5.parent.should == node2
      end
    end

    describe "#dfs" do
      it "finds the value in a tree" do
        node.dfs(6).should == node6
      end

      it "should return nil if the value is not found" do
        node.dfs(7).should == nil
      end

    end

    describe "#bfs" do
      it "finds the value in a tree" do
        node.bfs(6).should == node6
      end
    end

  end

end


