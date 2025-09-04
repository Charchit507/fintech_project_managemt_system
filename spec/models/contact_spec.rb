require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to(:organization) }
  it { should have_many(:portfolios).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
