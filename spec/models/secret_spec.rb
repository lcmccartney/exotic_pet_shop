require 'rails_helper'

RSpec.describe Secret, type: :model do
  it "should return a url for an animal giphy" do
    secret = Secret.image_path

    expect(secret).to include "giphy.com"
  end
end
