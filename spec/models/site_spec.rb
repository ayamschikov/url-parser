# frozen_string_literal: true

describe Site, type: :model do
  it 'should create new row' do
    Site.create(:url, :title, :status)
  end
end
