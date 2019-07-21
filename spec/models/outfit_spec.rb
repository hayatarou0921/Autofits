require 'rails_helper'

RSpec.describe Outfit, type: :model do
  let(:top_image_path) { File.join(Rails.root, 'spec/fixtures/Uniqlo1.jpg') }
  let(:trouser_image_path) { File.join(Rails.root, 'spec/fixtures/セルビっじ.jpg') }
  let(:shoe_image_path) { File.join(Rails.root, 'spec/fixtures/エアハラチ黒.jpg') }
  let(:top_image) { Rack::Test::UploadedFile.new(top_image_path) }
  let(:trouser_image) { Rack::Test::UploadedFile.new(trouser_image_path) }
  let(:shoe_image) { Rack::Test::UploadedFile.new(shoe_image_path) }
  let(:user) { User.find(1) }

  before do
    FactoryBot.create(:user, id:1)
  end

  it 'is valid with each id' do
    outfit = Outfit.new(
      user_id: 1,
      top_id: 1,
      trouser_id: 1,
      shoe_id: 1,
    )
    outfit.valid?
    expect(outfit).to be_valid
  end

  it 'is valid with none complete id' do
    outfit = Outfit.new(
      user_id: 1,
      top_id: nil,
      trouser_id: 1,
      shoe_id: 1,
    )
    outfit.valid?
    expect(outfit).to be_invalid
  end

end
