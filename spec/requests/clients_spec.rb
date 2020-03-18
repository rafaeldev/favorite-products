require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "GET /clients" do
    before do
      client = create(:client)

      allow(AuthorizeApiRequest).to receive(:call).and_return(OpenStruct.new(result: client))
    end

    it "works! (now write some real specs)" do
      get clients_path

      expect(response).to have_http_status(200)
    end
  end
end
