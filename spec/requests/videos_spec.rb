require 'rails_helper'

RSpec.describe 'Videos API', type: :request do
  # initialize test data
  let!(:videos) { create_list(:video, 10) }
  let(:video_id) { videos.first.id }

  # Test suite for GET /videos
  describe 'GET /videos' do
    # make HTTP get request before each example
    before { get '/videos' }

    it 'returns videos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /videos/:id
  describe 'GET /videos/:id' do
    before { get "/videos/#{video_id}" }

    context 'when the record exists' do
      it 'returns the video' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(video_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:video_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Video with 'id'=100/)
      end
    end
  end

  # Test suite for POST /videos
  describe 'POST /videos' do
    # valid payload
    let(:valid_attributes) { { videoid: 'vgeDev3535gF', title: 'Learn Elm', color: 'ffffff' } }

    context 'when the request is valid' do
      before { post '/videos', params: valid_attributes }

      it 'creates a video' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/videos', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Videoid can't be blank, Color can't be blank/)
      end
    end
  end

  # Test suite for PUT /videos/:id
  describe 'PUT /videos/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/videos/#{video_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /videos/:id
  describe 'DELETE /videos/:id' do
    before { delete "/videos/#{video_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end