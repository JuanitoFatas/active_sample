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

    context "with records" do
      it "sample a record" do
        user = User.create

        expect(User.sample.id).to eq user.id
      end
    end
  end
end
