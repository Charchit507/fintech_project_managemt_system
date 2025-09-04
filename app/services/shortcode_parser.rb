class ShortcodeParser
  def self.render(template_body, contact)
    org = contact.organization
    best = contact.portfolios.maximum(:performance) || 0
    worst = contact.portfolios.minimum(:performance) || 0

    result = template_body
      .gsub("{Contact.name}", contact.name)
      .gsub("{Contact.email}", contact.email)
      .gsub("{Organization.name}", org.name)
      .gsub("{Organization.email}", org.email)
      .gsub("{Portfolio.best_performance}", best.to_s)
      .gsub("{Portfolio.worst_performance}", worst.to_s)
    result
  end
end
