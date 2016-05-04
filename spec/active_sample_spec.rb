require "spec_helper"

describe ActiveSample do
  it "has a version number" do
    expect(ActiveSample::VERSION).not_to be nil
  end

  describe "#sample" do
    context "without records" do
      it "returns nil" do
        expect(User.sample).to be nil
      end
    end
  end
end
