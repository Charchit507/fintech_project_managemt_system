class EmailTemplatesController < ApplicationController
  def index
    @templates = EmailTemplate.all
  end

  def show
    @template = EmailTemplate.find(params[:id])
  end

  def new
    @template = EmailTemplate.new
  end

  def create
    @template = EmailTemplate.new(email_template_params)
    if @template.save
      redirect_to email_templates_path, notice: "Template created!"
    else
      render :new
    end
  end

  def edit
    @template = EmailTemplate.find(params[:id])
  end

  def update
    @template = EmailTemplate.find(params[:id])
    if @template.update(email_template_params)
      redirect_to email_templates_path, notice: "Template updated!"
    else
      render :edit
    end
  end

  def destroy
    EmailTemplate.find(params[:id]).destroy
    redirect_to email_templates_path, notice: "Template deleted!"
  end


  def preview
    @template = EmailTemplate.find(params[:id])
    @contact = Contact.find(params[:contact_id])
    @rendered_body = ShortcodeParser.render(@template.body, @contact).gsub("\n", "<br>").html_safe
    render :preview
  end

  private

  def email_template_params
    params.require(:email_template).permit(:subject, :body)
  end
end
