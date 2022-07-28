require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  # inicializando os dados
  let!(:schedules) { create_list(:schedule, 5) }
  let(:schedule_id) { schedules.first.id }

  # index
  describe "GET /schedules" do
    before { get "/api/v1/schedules" }
    it "return schedules" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it "return status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # show
  describe "GET /schedules/:id" do
    before { get "/api/v1/schedules/#{schedule_id}" }
    context "When schedules exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
      it "returns the schedule name" do
        expect(json["id"]).to eq(schedule_id)
      end
    end

    context "When schedule does not exist" do
      let(:schedule_id) { 0 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to include("Couldn't find Schedule with 'id'=0")
      end
    end
  end

  # create
  describe "POST /schedules" do
    let!(:medic) { create(:medic) }
    let(:valid_attributes) do
      {
        medic_id: medic.id,
        day: 5.days.from_now,
        time: Time.now + 5.days + 5.hours
      }
    end
    context "When request attributs are valid" do
      before { post "/api/v1/schedules", params: valid_attributes }
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
    context "When an invalid request" do
      before { post "/api/v1/schedules", params: {} }
      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end

  # update
  describe "PUT /api/v1/:id" do
    let(:new_day) { 5.days.from_now + 2.days }
    let!(:valid_attributes) { { day: new_day } }
    before { put "/api/v1/schedules/#{schedule_id}", params: valid_attributes }
    context "When schedules exists" do
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
      # it "updates the schedule" do
      #   updated_item = Schedule.find(schedule_id)
      #   expect(updated_item.day).to match(new_day)
      # end
    end
  end

  # delete
  describe "DELETE /api/v1/:id" do
    before { delete "/api/v1/schedules/#{schedule_id}" }
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
