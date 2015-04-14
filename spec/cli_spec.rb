require 'cli'

RSpec.describe Cli do
  let(:cli) {Cli.new}

  # it "should have a start method that returns true" do
  #   expect(cli.start).to be(true)
  # end

  # it "should have a robocop" do
  #   expect(cli.have_robocop?).to be(true)
  # end

  # it "should say 'CLI launching' on instantiation" do
  #   STDOUT.should_receive(:puts).with('CLI launching')
  # end

  it "should return 'invalid_command' method if bad input supplied to parse_command" do
    expect(cli.parse_command('kfkjsdkjflskldjf')).to eq('invalid_command(\'kfkjsdkjflskldjf\')')
  end

  it "should return 'move_robot_forward' if the input to parse_command is 'f' " do
    expect(cli.parse_command('f')).to eq('move_robot_forward')
  end

  it "should have a method corresponding move_robot_forward" do
    expect(cli.move_robot_forward)
  end

  it "should have a method corresponding to invalid_command" do
    expect(cli.invalid_command(''))
  end

  it "should not throw an error on current_status" do
    expect(cli.current_status)
  end

end
