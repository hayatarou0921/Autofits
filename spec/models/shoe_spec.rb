require 'rails_helper'

RSpec.describe Shoe, type: :model do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/セルビっじ.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }
  let(:user) { User.find(1) }

  before do
    FactoryBot.create(:user, id: 1)
  end

  it 'is valid with shoe image' do
    shoe = Shoe.new(
      user_id: user.id,
      image: image
    )
    expect(shoe).to be_valid
  end
  it 'is invalid with no image' do
    shoe = Shoe.new(
      user_id: user.id,
      image: nil
    )
    expect(shoe).to be_invalid
  end
end
