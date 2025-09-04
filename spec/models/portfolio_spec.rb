require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it { should belong_to(:contact) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:balance) }
  it { should validate_presence_of(:performance) }
end
