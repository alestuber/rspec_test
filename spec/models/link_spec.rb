require "rails_helper"

RSpec.describe Link, "validations" do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:title) }
end

RSpec.describe Link, ".hottest_first" do
  it "returns the links: hottest to coldest" do
    cold_link = create(:link, votes: 3, downvotes: 3)
    hot_link = create(:link, votes: 5, downvotes: 1)
    middle_link = create(:link, votes: 2, downvotes: 1)

    expect(Link.hottest_first).to eq [hot_link, middle_link, cold_link]
  end
end

RSpec.describe Link, "#upvote" do
  it "increments upvotes" do
    link = build(:link, votes: 1)

    link.upvote

    expect(link.votes).to eq 2
  end
end

RSpec.describe Link, "#score" do
  it "returns the upvotes minus the downvotes" do
    link = Link.new(votes: 2, downvotes: 1)

    expect(link.score).to eq 1
  end
end
