require "rails_helper"
describe "trying to get a json document", :type => :request do
  it "sends request to controller" do
    
    get '/orders'
    expect(response).to have_http_status(:ok)
  end
end
