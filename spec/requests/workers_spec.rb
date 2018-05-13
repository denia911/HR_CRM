require 'rails_helper'

RSpec.describe 'workers API', type: :request do
  let!(:companies) { create_list(:company, 10) }
  let(:company_id) { companies.first.id }
  let!(:workers) { create_list(:worker, 10, company_id: company_id) }
  let(:worker_id) { workers.first.id }

  describe 'GET /api/v1/workers/:id' do
    before { get "/api/v1/workers/#{worker_id}" }

    context 'when the record exist' do
      it 'returns the worker' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(worker_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PUT /api/v1/workers/:id' do
    let(:valid_attributes) { { name: 'Dr. Dre' } }

    context 'when the record exist' do
      before { put "/api/v1/workers/#{worker_id}", params: valid_attributes }

      it 'updates the record' do
        expect(json['name']).to eq('Dr. Dre')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/v1/workers/:id' do
    before { delete "/api/v1/workers/#{worker_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'GET /api/v1/workers/:worker_id/another_company_list' do
    before { get "/api/v1/workers/#{worker_id}/another_company_list" }

    it 'return all companies where not this worker' do
      expect(json.size).to eq(9)
      expect(json.map { |company| company['id'] }).not_to eq(company_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /api/v1/workers/:worker_id/send_to_company' do
    let(:valid_attributes) { { new_id: (company_id + 1) } }

    before { patch "/api/v1/workers/#{worker_id}/send_to_company", params: valid_attributes }

    it 'return company where sent worker' do
      expect(json['id']).to eq(company_id + 1)
    end

    it 'company where sent worker not company where was worker' do
      expect(json['id']).not_to eq(company_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
