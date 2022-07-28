require 'rails_helper'

RSpec.describe "Medics", type: :request do
  # inicializando os dados
  let!(:medics) { create_list(:medic, 5) }
  let(:medic_id) { medics.first.id }

  # index
  describe "GET /medics" do
    before { get "/api/v1/medics" }
    it "return medics" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # show
  describe "GET /medics/:id" do
    before { get "/api/v1/medics/#{medic_id}" }
    context "When medic exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
      it "returns the medic name" do
        expect(json["id"]).to eq(medic_id)
      end
    end
    context "When medic does not exists" do
      let(:medic_id) { 0 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns not found message" do
        expect(response.body).to include("Couldn't find Medic with 'id'=0")
      end
    end
  end

  # create
  describe "POST /medics/:id" do
    let!(:specialty) { create(:specialty) }
    let(:valid_attributes) do
      {
        name: "Magno",
        crm: "123432543",
        email: "teste@gmail.com",
        telephone: "85994294862",
        specialty_id: specialty.id
      }
    end
    context "When request attributes are valid" do
      before { post "/api/v1/medics", params: valid_attributes }
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
    context "When an invalid request" do
      before { post "/api/v1/medics", params: {} }
      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end

  # update
  describe "PUT /medics/:id" do
    let!(:valid_attributes) { { name: "Magno" } }
    before { put "/api/v1/medics/#{medic_id}", params: valid_attributes }
    context "When medic exits" do
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
      it "update the medic" do
        updated_item = Medic.find(medic_id)
        expect(updated_item.name).to match(/Magno/)
      end
    end

    context "When the book does not exist" do
      let(:medic_id) { 0 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to include("Couldn't find Medic with 'id'=0")
      end
    end
  end

  # destroy
  describe "DELETE /medics/:id" do
    before { delete "/api/v1/medics/#{medic_id}" }
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
