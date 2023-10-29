require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:uni) }
  it { should validate_uniqueness_of(:uni) }
  it { should have_secure_password }
end

