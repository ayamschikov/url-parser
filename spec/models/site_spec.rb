# frozen_string_literal: true
require_relative 'spec_helper'

describe Site, type: :model do
  it 'should create new row' do
    Site.create(:url, :title, :status)
  end
end
