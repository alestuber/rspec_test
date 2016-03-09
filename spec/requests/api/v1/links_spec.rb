require 'rails_helper'

RSpec.describe "GET /api/v1/links" do
  it "returns a list of all links, hottest 1st" do
    hot_link = create(:link, votes: 5)
    cold_link = create(:link)

    get "/api/v1/links"

    expect(json_body["data"].count).to eq 2

    first_object_from_response = json_body["data"][0]

    expect(first_object_from_response).to eq(serialized_model(hot_link))
  end
end

RSpec.describe "POST /api/v1/links" do
  it "creates the link" do
    link_params = attributes_for(:link)

    post "/api/v1/links", link: link_params

    expect(response).to have_http_status(:created)
    expect(Link.last.title).to eq link_params[:title]
  end

  context "when there are invalid attributes" do
    it "returns a 422, with errors" do
      link_params = attributes_for(:link, :invalid)

      post "/api/v1/links", link: link_params

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json_body.fetch("errors")).not_to be_empty
    end
  end
end
