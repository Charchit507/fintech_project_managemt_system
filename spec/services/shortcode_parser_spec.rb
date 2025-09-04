require 'rails_helper'

RSpec.describe ShortcodeParser do
  let(:organization) { Organization.create!(name: "Test Org", email: "org@test.com") }
  let(:contact) { Contact.create!(name: "Test User", email: "user@test.com", organization: organization) }

  before do
    contact.portfolios.create!(name: "Fund A", balance: 1000, performance: 5)
    contact.portfolios.create!(name: "Fund B", balance: 2000, performance: -1)
  end

  let(:template_body) do
    "Hello {Contact.name}, your org is {Organization.name}, best perf {Portfolio.best_performance}%, worst perf {Portfolio.worst_performance}%."
  end

  it 'replaces shortcodes correctly' do
    result = ShortcodeParser.render(template_body, contact)
    expect(result).to include("Hello Test User")
    expect(result).to include("your org is Test Org")
    expect(result).to match(/best perf 5(\.0)?%/)
    expect(result).to match(/worst perf -1(\.0)?%/)
  end
end
