require 'rails_helper'

RSpec.describe 'Comments API' do
  # Initialize the test data
  let!(:video) { create(:video) }
  let!(:comments) { create_list(:comment, 20, video_id: video.id) }
  let(:video_id) { video.id }
  let(:id) { comments.first.id }

  # Test suite for GET /videos/:video_id/comments
  describe 'GET /videos/:video_id/comments' do
    before { get "/videos/#{video_id}/comments" }

    context 'when video exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all video comments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when video does not exist' do
      let(:video_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Video/)
      end
    end
  end

  # Test suite for GET /videos/:video_id/comments/:id
  describe 'GET /videos/:video_id/comments/:id' do
    before { get "/videos/#{video_id}/comments/#{id}" }

    context 'when video comment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the comment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when video comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # Test suite for PUT /videos/:video_id/comments
  describe 'POST /videos/:video_id/comments' do
    let(:valid_attributes) { { text: 'Visit Narnia'} }

    context 'when request attributes are valid' do
      before { post "/videos/#{video_id}/comments", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/videos/#{video_id}/comments", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Text can't be blank/)
      end
    end
  end

  # Test suite for PUT /videos/:video_id/comments/:id
  describe 'PUT /videos/:video_id/comments/:id' do
    let(:valid_attributes) { { text: 'Mozart' } }

    before { put "/videos/#{video_id}/comments/#{id}", params: valid_attributes }

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.text).to match(/Mozart/)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # Test suite for DELETE /videos/:id
  describe 'DELETE /videos/:id' do
    before { delete "/videos/#{video_id}/comments/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end