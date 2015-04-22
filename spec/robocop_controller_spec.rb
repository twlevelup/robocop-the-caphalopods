require 'robocop_controller'
require 'robocop'

RSpec.describe RobocopController do
  let(:ctrl) {RobocopController.new}

  context "when the controller is initialized" do

    it "should contain a robocop" do
      expect(ctrl.robocop.class).to eq(Robocop)
    end

  end

end