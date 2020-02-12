# frozen_string_literal: true
require 'spec_helper'

describe Site, type: :model do
  it 'should create new row' do
    sites = DB[:sites]
    sites.insert(url: 'url1', title: 'title1', status: 200)
    expect(sites.count).to eq(1)
  end
end
