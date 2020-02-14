# frozen_string_literal: true

require 'spec_helper'

describe UrlParser, type: :feature do
  it 'should return google.com info' do
    site = UrlParser.url_info('http://google.com')

    expect(site[:title]).to eq('Google')
    expect(site[:status]).to eq(200)
  end
end
