require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:workers).dependent(:destroy) }

  it { should validate_presence_of(:name) }

  it { should_not validate_presence_of(:description) }
end
