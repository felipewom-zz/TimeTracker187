class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    contact_id = params[:contact_id] unless params[:contact_id].nil?
    @contact = save_or_update_parameters(params[:contact], contact_id)
    contact_user = User.find(current_user.id)
    contact_user.contact_id = @contact.id
    contact_user.save!
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, :notice => 'Contato criado com sucesso.' }
        format.json { render :json => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, :notice => 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  def save_or_update_parameters(parameters, contact_id = nil)
    if user.nil?
      @contact = Contact.new
    else
      @contact = Contact.find(contact_id)
    end
    @contact.address = parameters[:address]
    @contact.neighbourhood = parameters[:neighbourhood]
    @contact.city = parameters[:city]
    @contact.state = parameters[:state]
    @contact.postal_code = parameters[:postal_code]
    @contact.phone_number = parameters[:phone_number]
    @contact.cellphone = parameters[:cellphone]
    @contact.save!
    return @contact
  end
end
