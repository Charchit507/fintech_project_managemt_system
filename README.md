# FinTech Portfolio Management System (PMS)

## Setup Instructions

- Ruby version: 3.1.0
- Rails version: 7.1.5.2
- clone repository: `git clone https://github.com/Charchit507/fintech_project_managemt_system.git`
- Run `bundle install`
- Set up database: `rails db:create db:migrate db:seed`
- Start the server: `rails server`

## Testing

- Run tests with `bundle exec rspec`

## Features

- Contacts dashboard showing contacts with portfolios and performance
- Email templates dashboard with CRUD and preview
- Email preview with shortcode parsing
- Simulated email sending with flash messages

## Sample Data

- Includes 2 organizations, 3 contacts, multiple portfolios, and 2 email templates.
- Seeded via `rails db:seed`.

## Assumptions

- Email sending is simulated, no real emails sent
- Shortcodes are limited to predefined fields as per assignment
