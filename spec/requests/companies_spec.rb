require 'rails_helper'

RSpec.describe 'Companies API', type: :request do
  let!(:companies) { create_list(:company, 10) }
  let(:company_id) { companies.first.id }

  describe 'GET /api/v1/companies' do
    before { get '/api/v1/companies' }

    it 'returns companies' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/companies/:id' do
    before { get "/api/v1/companies/#{company_id}" }

    context 'when the record exist' do
      it 'returns the company' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(company_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /api/v1/companies' do
    let(:valid_attributes) { { name: 'Big company' } }

    context 'when the request is valid' do
      before { post '/api/v1/companies', params: valid_attributes }

      it 'creates a company' do
        expect(json['name']).to eq('Big company')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PUT /api/v1/companies/:id' do
    let(:valid_attributes) { { name: 'Dr. Dre' } }

    context 'when the record exist' do
      before { put "/api/v1/companies/#{company_id}", params: valid_attributes }

      it 'updates the record' do
        expect(json['name']).to eq('Dr. Dre')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/v1/companies/:id' do
    before { delete "/api/v1/companies/#{company_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'GET /api/v1/companies/:company_id/workers/alls' do
    let!(:workers) { create_list(:worker, 10, company_id: company_id) }
    before { get "/api/v1/companies/#{company_id}/workers/all" }

    it 'returns companies' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/companies/:company_id/workers/create' do
    let!(:workers) { create_list(:worker, 10, company_id: company_id) }
    let(:valid_attributes) { { name: 'Big company' } }

    context 'when the request is valid' do
      before { put "/api/v1/companies/#{company_id}/workers/create", params: valid_attributes }

      it 'creates a company' do
        expect(json['name']).to eq('Big company')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
