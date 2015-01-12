class WorksController < ApplicationController
  # GET /works
  # GET /works.json
  def index
    if params[:date].present?
      @work = Work.where("historic_date = ?", params[:date]).first
      if @work.nil?
        redirect_to :controller => :works, :action => :new, :date => params[:date]
      else
        redirect_to edit_work_path(@work)
      end
    else
      @works = Work.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @works }
      end
    end
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work = Work.find(params[:id])
    @works = Work.where("historic_date = ?", @work.historic_date)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @work }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    if params[:date].present?
      @historic_date = params[:date]
    else
      @historic_date = Time.now.strftime("%Y/%m/%d")
    end
    @work = Work.new
    @historic_start = Time.now.strftime('%H:%M')
    @historic_finish = (Time.now+(4*60*60)).strftime('%H:%M')
    @duration_to_show = format("%02d:%02d", (14400000/1000)/(60*60), ((14400000/1000)/60)%60)
    unless params[:historic_date].present?
      @works = Work.where("historic_date > ?", (Time.now-1.day).strftime("%Y/%m/%d"))
    else
      @works = Work.where("historic_date = ?", params[:historic_date])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
    @historic_date = @work.historic_date.strftime("%Y/%m/%d")
    @historic_start = @work.historic_start
    @historic_finish = @work.historic_finish
    @duration_to_show = format("%02d:%02d", (@work.historic_duration/1000)/(60*60), ((@work.historic_duration/1000)/60)%60)
    @works = Work.where("historic_date = ?", @work.historic_date)
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(params[:work])
    unless params[:historic_date].present?
      @works = Work.where("historic_date > ?", (Time.now-1.day).strftime("%Y/%m/%d"))
    else
      @works = Work.where("historic_date = ?", params[:historic_date])
    end
    respond_to do |format|
      if @work.save
        format.html { redirect_to new_work_path, :notice => 'Work was successfully created.' }
        format.json { render :json => @work, :status => :created, :location => @work }
      else
        format.html { render :action => "new" }
        format.json { render :json => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = Work.find(params[:id])
    unless params[:historic_date].present?
      @works = Work.where("historic_date > ?", (Time.now-1.day).strftime("%Y/%m/%d"))
    else
      @works = Work.where("historic_date = ?", params[:historic_date])
    end
    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to new_work_path, :notice => 'Work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end
end
