require 'rails_helper'

RSpec.describe "Specialties", type: :request do
  # inicializando os dados
  let!(:specialties) { create_list(:specialty, 5) }
  let!(:specialty_id) { specialties.first.id }
  
  # index
  describe "GET /specialties" do
    before { get "/api/v1/specialties" }
    it "return specialties" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # show
  describe "GET /specialties/:id" do
    before { get "/api/v1/specialties/#{specialty_id}" }
    context "When specialty exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
      it "returns the specialty name" do
        expect(json["id"]).to eq(specialty_id)
      end
    end

    context "When specialty does not exist" do
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to include("Couldn't find Specialty with 'id'=0")
      end
    end
  end

  # create
  describe "POST /specialties" do
    let(:valid_name) { { name: "Dentist" } }
    context "When the request is valid" do
      before { post "/api/v1/specialties", params: valid_name }
      it "creates s specialty" do
        expect(json["name"]).to eq("Dentist")
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "When an invalid request" do
      before { post "/api/v1/specialties", params: {} }
      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
      it "returns a failure message" do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  # update
  describe "PUT /specialties/:id" do
    let(:valid_attributes) { { name: "Pediatric" } }
    before { put "/api/v1/specialties#{specialty_id}", params: valid_attributes }
    context "When specialty exists" do
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
      it "updates the specialty" do
        updated_item = Specialty.find(specialty_id)
        expect(updated_item.title).to match(/Pediatric/)
      end
    end

    context "When the book does not exist" do
      let(:specialty_id) { 0 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to include("Couldn't find Book with 'id'=0")
      end
    end
  end

  # delete
  describe "DELETE /specialties/:id" do
    before { delete "/api/v1/specialties/#{specialty_id}" }
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

end
