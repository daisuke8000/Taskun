require 'rails_helper'

RSpec.describe "Tasks", type: :request do

<<<<<<< HEAD
  describe "GET /new" do
    it "returns http success" do
      get "/tasks/new"
=======
  describe "GET /index" do
    it "returns http success" do
      get "/tasks/index"
>>>>>>> master
      expect(response).to have_http_status(:success)
    end
  end

end
