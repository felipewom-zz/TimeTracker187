class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
  end

  def edit
    if current_user.contact_id.nil?
      @contact = Contact.new
    else
      @contact = Contact.find(current_user.contact_id)
    end
    super
  end

  def update
    contact = ContactsController.new
    contact_id = current_user.contact_id unless current_user.contact_id.nil?
    contact.save_or_update_parameters(params[:user][:contact], contact_id)
    params[:user].delete(:contact)
    super
  end
end