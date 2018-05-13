require 'rails_helper'

RSpec.describe Worker, type: :model do
  it { should belong_to(:company) }

  it { should validate_presence_of(:name) }

  it { should_not validate_presence_of(:description) }
end
