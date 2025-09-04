class ContactsController < ApplicationController
  def index
    @contacts = Contact.includes(:organization, :portfolios).all
    @email_templates = EmailTemplate.all
  end

  def preview
    @contact = Contact.find(params[:id])
    @template = EmailTemplate.find(params[:template_id])
    if params[:commit] == "preview"
      @rendered_body = ShortcodeParser.render(@template.body, @contact).gsub("\n", "<br>").html_safe
      render :preview
    elsif params[:commit] == "send"
      flash[:notice] = "Simulated sending '#{@template.subject}' email to #{@contact.email}"
      redirect_to contacts_path
    else
      redirect_to contacts_path, alert: "Unknown action"
    end
  end

  def send_email
    contact = Contact.find(params[:id])
    template = EmailTemplate.find(params[:template_id])
    # Simulate sending email by flashing a message
    flash[:notice] = "Simulated sending '#{template.subject}' email to #{contact.email}"
    redirect_to contacts_path
  end
end
