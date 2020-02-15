# frozen_string_literal: true

require 'spec_helper'

describe UrlParser, type: :feature do
  it 'should return google.com info' do
    site = UrlParser.url_info('http://google.com')

    expect(site[:title]).to eq('Google')
    expect(site[:status]).to eq(200)
  end

  it 'should parse info when response status is not 200' do
    stub_request(:any, 'http://ya.ru').to_return(status: 429, body: '', headers: {})

    site = UrlParser.url_info('http://ya.ru')

    expect(site[:title]).to eq('')
    expect(site[:status]).to eq(429)
  end

  it 'should return error with invalid url' do
    stub_request(:any, 'ya.ru').to_return(status: 429, body: '', headers: {})

    site = UrlParser.url_info('ya.ru')

    expect(site).to eq('')
  end
end
