class TicketCommentsController < ApplicationController
  # GET /ticket_comments
  # GET /ticket_comments.json
  def index
    @ticket_comments = TicketComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ticket_comments }
    end
  end

  # GET /ticket_comments/1
  # GET /ticket_comments/1.json
  def show
    @ticket_comment = TicketComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ticket_comment }
    end
  end

  # GET /ticket_comments/new
  # GET /ticket_comments/new.json
  def new
    @ticket_comment = TicketComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ticket_comment }
    end
  end

  # GET /ticket_comments/1/edit
  def edit
    @ticket_comment = TicketComment.find(params[:id])
  end

  # POST /ticket_comments
  # POST /ticket_comments.json
  def create
    @ticket_comment = TicketComment.new(params[:ticket_comment])

    respond_to do |format|
      if @ticket_comment.save
        format.html { redirect_to @ticket_comment, :notice => 'Ticket comment was successfully created.' }
        format.json { render :json => @ticket_comment, :status => :created, :location => @ticket_comment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ticket_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticket_comments/1
  # PUT /ticket_comments/1.json
  def update
    @ticket_comment = TicketComment.find(params[:id])

    respond_to do |format|
      if @ticket_comment.update_attributes(params[:ticket_comment])
        format.html { redirect_to @ticket_comment, :notice => 'Ticket comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ticket_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_comments/1
  # DELETE /ticket_comments/1.json
  def destroy
    @ticket_comment = TicketComment.find(params[:id])
    @ticket_comment.destroy

    respond_to do |format|
      format.html { redirect_to ticket_comments_url }
      format.json { head :no_content }
    end
  end
end
