class TicketPrioritiesController < ApplicationController
  # GET /ticket_priorities
  # GET /ticket_priorities.json
  def index
    @ticket_priorities = TicketPriority.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ticket_priorities }
    end
  end

  # GET /ticket_priorities/1
  # GET /ticket_priorities/1.json
  def show
    @ticket_priority = TicketPriority.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ticket_priority }
    end
  end

  # GET /ticket_priorities/new
  # GET /ticket_priorities/new.json
  def new
    @ticket_priority = TicketPriority.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ticket_priority }
    end
  end

  # GET /ticket_priorities/1/edit
  def edit
    @ticket_priority = TicketPriority.find(params[:id])
  end

  # POST /ticket_priorities
  # POST /ticket_priorities.json
  def create
    @ticket_priority = TicketPriority.new(params[:ticket_priority])

    respond_to do |format|
      if @ticket_priority.save
        format.html { redirect_to @ticket_priority, :notice => 'Ticket priority was successfully created.' }
        format.json { render :json => @ticket_priority, :status => :created, :location => @ticket_priority }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ticket_priority.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticket_priorities/1
  # PUT /ticket_priorities/1.json
  def update
    @ticket_priority = TicketPriority.find(params[:id])

    respond_to do |format|
      if @ticket_priority.update_attributes(params[:ticket_priority])
        format.html { redirect_to @ticket_priority, :notice => 'Ticket priority was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ticket_priority.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_priorities/1
  # DELETE /ticket_priorities/1.json
  def destroy
    @ticket_priority = TicketPriority.find(params[:id])
    @ticket_priority.destroy

    respond_to do |format|
      format.html { redirect_to ticket_priorities_url }
      format.json { head :no_content }
    end
  end
end
