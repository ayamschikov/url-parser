# frozen_string_literal: true

require 'spec_helper'

describe SiteService, type: :feature do
  let(:urls) { ['http://google.com'] }

  it 'should visit' do
    SiteService.upload_sites_by_urls(urls)

    expect(DB[:sites].count).to eq(1)
    expect(DB[:sites].first[:status]).to eq(200)
  end
end
