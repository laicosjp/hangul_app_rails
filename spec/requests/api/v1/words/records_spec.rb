require 'rails_helper'

RSpec.describe 'Api::V1::Words::Records', type: :request do
  let(:user) { create(:user) }
  let(:word) { create(:word) }
  let(:headers) { user.create_new_auth_token }

  describe 'GET #show' do
    context 'when the word record exists' do
      let!(:word_record) { create(:word_record, user:, word:) }

      it 'returns the word record' do
        get(api_v1_word_records_path(word_id: word.id), headers:)

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['id']).to eq(word_record.id)
        expect(JSON.parse(response.body)['status']).to eq(word_record.status)
      end
    end

    context 'when the word record does not exist' do
      it 'returns a 404 status' do
        get(api_v1_word_records_path(word_id: word.id), headers:)

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PUT #update' do
    context 'when the word record exists' do
      let!(:word_record) { create(:word_record, user:, word:) }
      let(:valid_attributes) { { status: 'incorrect' } }

      it 'updates the word record' do
        put(api_v1_word_records_path(word_id: word.id), params: { word_records: valid_attributes }, headers:)

        expect(response).to have_http_status(:success)
        expect(word_record.reload.status).to eq('incorrect')
      end
    end

    context 'when the word record does not exist' do
      let(:valid_attributes) { { status: 'incorrect' } }

      it 'creates a new word record' do
        expect do
          put api_v1_word_records_path(word_id: word.id), params: { word_records: valid_attributes }, headers:
        end.to change(WordRecord, :count).by(1)

        expect(response).to have_http_status(:success)
        expect(WordRecord.last.status).to eq('incorrect')
      end
    end
  end
end
