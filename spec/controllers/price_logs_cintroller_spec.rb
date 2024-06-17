require 'rails_helper'

RSpec.describe PriceLogsController, type: :controller do
    let(:valid_attributes) {
        {
        product_id: 1,
        price: 100.0
        }
    }
    
    let(:invalid_attributes) {
        { product_id: nil }
    }
    
    describe "GET #index" do
        it "returns a success response" do
        PriceLog.create! valid_attributes
        get :index
        expect(response).to be_successful
        end
    end
    
    describe "GET #show" do
        it "returns a success response" do
        price_log = PriceLog.create! valid_attributes
        get :show, params: { id: price_log.to_param }
        expect(response).to be_successful
        end
    end
    
    describe "POST #create" do
        context "with valid params" do
        it "creates a new PriceLog" do
            expect {
            post :create, params: { price_log: valid_attributes }
            }.to change(PriceLog, :count).by(1)
        end
    
        it "renders a JSON response with the new price_log" do
            post :create, params: { price_log: valid_attributes }
            expect(response).to have_http_status(:created)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
        end
    
        context "with invalid params" do
        it "renders a JSON response with errors for the new price_log" do
            post :create, params: { price_log: invalid_attributes }
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
        end
    end
    end