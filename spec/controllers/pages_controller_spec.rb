require "rails_helper"

RSpec.describe PagesController do
  describe "#about" do
    def do_request
      get :about
    end

    before { do_request }

    it { should respond_with(200) }
  end
end
