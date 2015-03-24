require 'robocop'

RSpec.describe Robocop do
  let(:d) {Robocop.new}

  it "should beep" do
    expect(d.beep).to eq('beep boop')
  end

  it "can move forward" do
    expect(d.can_move_forward?).to eq(true)
  end

  it "moves north if facing north" do
    old_position = d.get_position
    orientation = d.get_heading
    if orientation == :north
      d.move_forward
      expect(d.get_position[1]).to eq(old_position[1] + 1)
      expect(d.get_position[0]).to eq(old_position[0])
    end

  end

  it "moves south if facing south" do
    old_position = d.get_position
    orientation = d.get_heading
    if orientation == :south
      d.move_forward
      expect(d.get_position[1]).to eq(old_position[1] - 1)
      expect(d.get_position[0]).to eq(old_position[0])
    end

  end

  it "moves east if facing east" do
    old_position = d.get_position
    orientation = d.get_heading
    if orientation == :east
      d.move_forward
      expect(d.get_position[1]).to eq(old_position[1])
      expect(d.get_position[0]).to eq(old_position[0] - 1)
    end

  end

  it "moves west if facing west" do
    old_position = d.get_position
    orientation = d.get_heading
    if orientation == :west
      d.move_forward
      expect(d.get_position[1]).to eq(old_position[1])
      expect(d.get_position[0]).to eq(old_position[0] + 1)
    end

  end

  it "has a heading" do
    expect(d.get_heading.nil?).to eq(false)
  end

  it "is facing north" do
    d.set_heading(:north)
    expect(d.get_heading).to eq(:north)
  end

  it "is facing south" do
    d.set_heading(:south)
    expect(d.get_heading).to eq(:south)
  end

  it "is facing west" do
    d.set_heading(:west)
    expect(d.get_heading).to eq(:west)
  end

  it "is facing east" do
    d.set_heading(:east)
    expect(d.get_heading).to eq(:east)
  end

  it "gives a valid position" do
    expect(d.get_position).to be_a(Array)
    expect(d.get_position.size).to eq(2)
    expect(d.get_position.first.is_a?(Numeric))
    expect(d.get_position.last.is_a?(Numeric))
  end



end
