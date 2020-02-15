# frozen_string_literal: true

require 'spec_helper'

describe App, type: :controller do
  describe '/' do
    it 'should visit' do
      visit '/'

      expect(page.status_code).to eq(200)
      expect(page).to have_content('Root path')
    end
  end

  describe '/sites' do
    let(:urls) { ['http://google.com'] }

    it 'should accept urls by post' do
      post '/sites', urls: urls

      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('Parsed')
    end

    it 'should insert to db sites info' do
      post '/sites', urls: urls

      expect(Site.count).to eq(1)
      expect(Site.first[:status]).to eq(200)
      expect(Site.first[:title]).to eq('Google')
    end
  end
end
