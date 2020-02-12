# frozen_string_literal: true

require 'spec_helper'

describe SiteService, type: :feature do
  it 'should visit' do
    SiteService.upload_sites_by_urls(['http://google.com', 'http://ya.ru'])

    expect(DB[:sites].count).to eq(2)
    expect(DB[:sites].first[:status]).to eq(200)
  end
end
