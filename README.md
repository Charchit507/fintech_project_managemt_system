# FinTech Portfolio Management System (PMS)

## Setup Instructions

- Ruby version: 3.x
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

## Assumptions

- Email sending is simulated, no real emails sent
- Shortcodes are limited to predefined fields as per assignment
