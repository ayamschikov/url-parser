# frozen_string_literal: true

require 'spec_helper'

describe Site, type: :model do
  it 'should create new row' do
    create :site

    expect(Site.count).to eq(1)
  end

  it "should raise error if there's not enough fields" do
    site = build :site, title: nil

    expect(site.valid?).to be_falsey
    expect { site.save }.to raise_error(Sequel::ValidationFailed)
  end
end
