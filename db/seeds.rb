puts "Deleting previous data..."
Organization.destroy_all
Contact.destroy_all
Portfolio.destroy_all
EmailTemplate.destroy_all
puts "Previous data deleted."

puts "Creating new seed data..."

# Organizations
acme = Organization.create!(name: "Acme Corp", email: "acme@example.com")
globex = Organization.create!(name: "Globex Inc", email: "globex@example.com")

# Contacts
alice = acme.contacts.create!(name: "Alice Johnson", email: "alice@example.com")
bob = globex.contacts.create!(name: "Bob Smith", email: "bob@example.com")
carol = acme.contacts.create!(name: "Carol Davis", email: "carol@example.com")

# Portfolios for Alice
alice.portfolios.create!(name: "Growth Fund", balance: 10000, performance: 15)
alice.portfolios.create!(name: "Income Fund", balance: 5000, performance: -2)

# Portfolios for Bob
bob.portfolios.create!(name: "Equity Fund", balance: 20000, performance: 8)
bob.portfolios.create!(name: "Bonds Fund", balance: 7500, performance: 3)

# Portfolios for Carol
carol.portfolios.create!(name: "Dividend Fund", balance: 8000, performance: 6)

# Email Templates
EmailTemplate.create!(
  subject: "Monthly Portfolio Digest",
  body: <<~BODY
    Hello {Contact.name},

    Your organization: {Organization.name}

    Best portfolio: {Portfolio.best_performance}%
    Worst portfolio: {Portfolio.worst_performance}%
  BODY
)

EmailTemplate.create!(
  subject: "Welcome Email",
  body: <<~BODY
    Hello {Contact.name},

    Welcome to {Organization.name}! We're excited to have you.

    Best Regards,
    The Team
  BODY
)

puts "New seed data created successfully."
