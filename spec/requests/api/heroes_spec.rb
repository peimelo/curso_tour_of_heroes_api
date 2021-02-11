require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe '/api/heroes', type: :request do
  let(:valid_attributes) { attributes_for :hero }
  let(:invalid_attributes) { attributes_for :invalid_hero }

  let(:valid_headers) do
    { Authorization: valid_attributes[:token] }
  end
  let(:invalid_headers) do
    { Authorization: '123456789' }
  end

  describe 'GET /index' do
    context 'with headers' do
      it 'renders a successful response' do
        hero = Hero.create! valid_attributes
        get api_heroes_url, headers: valid_headers, as: :json
        expect(response).to be_successful
        expect(json_response[0][:name]).to eq hero.name
      end
    end

    context 'without headers' do
      it 'renders a JSON response with an unauthorized status' do
        Hero.create! valid_attributes
        get api_heroes_url, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid headers' do
      it 'renders a JSON response with an unauthorized status' do
        Hero.create! valid_attributes
        get api_heroes_url, headers: invalid_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      hero = Hero.create! valid_attributes
      get api_hero_url(hero), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Hero' do
        expect do
          post api_heroes_url,
               params: { hero: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Hero, :count).by(1)
      end

      it 'renders a JSON response with the new hero' do
        post api_heroes_url,
             params: { hero: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Hero' do
        expect do
          post api_heroes_url,
               params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        end.to change(Hero, :count).by(0)
      end

      it 'renders a JSON response with errors for the new hero' do
        post api_heroes_url,
             params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for :hero }

      it 'updates the requested hero' do
        hero = Hero.create! valid_attributes
        patch api_hero_url(hero),
              params: { hero: new_attributes }, headers: valid_headers, as: :json
        hero.reload
        expect(hero.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the hero' do
        hero = Hero.create! valid_attributes
        patch api_hero_url(hero),
              params: { hero: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the hero' do
        hero = Hero.create! valid_attributes
        patch api_hero_url(hero),
              params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested hero' do
      hero = Hero.create! valid_attributes
      expect do
        delete api_hero_url(hero), headers: valid_headers, as: :json
      end.to change(Hero, :count).by(-1)
    end
  end
end
