class ClientsController < ApplicationController
  @@lock = Mutex.new
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    @contact = Contact.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @@lock.synchronize do
      contact = ContactsController.new
      contact_saved = contact.save_or_update_parameters(params[:client][:contact], params[:client][:contact_id].presence || nil)
      params[:client].delete(:contact)
      params[:client][:contact_id] = contact_saved.id
      @client = Client.new(params[:client])
      respond_to do |format|
        if @client.save
          format.html { redirect_to client_path(@client), :notice => 'Client was successfully created.' }
          format.json { render :json => @client, :status => :created, :location => @client }
        else
          format.html { render :action => "new" }
          format.json { render :json => @client.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, :notice => 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def save_or_update_parameters(parameters = nil, client_id = nil)
    unless parameters.nil?
      if client_id.nil?
        @client = Client.new
      else
        @client = Client.find(client_id)
      end
      @client.name = parameters[:name]
      @client.status_id = parameters[:status_id]
      @client.description = parameters[:description]
      @client.hourly_rate = parameters[:hourly_rate]
      @client.url = parameters[:url]
      @client.contact_id = parameters[:contact_id]
      @client.save!
    end
    return @contact
  end
end
