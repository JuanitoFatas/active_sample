require "spec_helper"

describe ActiveSample do
  it "has a version number" do
    expect(ActiveSample::VERSION).not_to be nil
  end

  describe "#sample" do
    before { User.delete_all }

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

      it "sample many records" do
        3.times { User.create }

        result = User.sample(2)

        expect(result).to be_a ActiveRecord::Relation
        expect(result.size).to eq 2
      end

      context "sample size > all records size" do
        it "sample all but shuffled" do
          2.times { User.create }

          sample = User.sample(3)
          other_sample = User.sample(3)

          expect(sample).to be_a ActiveRecord::Relation
          expect(sample.size).to eq 2
          expect(sample.sort).to eq other_sample.sort
        end
      end
    end
  end
end
