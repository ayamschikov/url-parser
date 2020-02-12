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
    it 'should accept urls by post' do
      post "/sites", urls: ['http://google.com']

      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('Parsed')
    end

    it 'should insert to db sites info' do
      post "/sites", urls: ['http://google.com', 'http://ya.ru']

      expect(DB[:sites].count).to eq(2)
      expect(DB[:sites].first[:status]).to eq(200)
    end
  end
end
