require 'cli'

RSpec.describe Cli do
  let(:cli) {Cli.new}

  it "should have a method corresponding to invalid_command" do
    expect(cli.invalid_command(''))
  end

end
