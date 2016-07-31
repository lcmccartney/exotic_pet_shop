require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should have_many(:orders) }
  it { should define_enum_for(:role) }
end
