class MembersProjectsController < ApplicationController
  # GET /members_projects
  # GET /members_projects.json
  def index
    @members_projects = MembersProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @members_projects }
    end
  end

  # GET /members_projects/1
  # GET /members_projects/1.json
  def show
    @members_project = MembersProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @members_project }
    end
  end

  # GET /members_projects/new
  # GET /members_projects/new.json
  def new
    @members_project = MembersProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @members_project }
    end
  end

  # GET /members_projects/1/edit
  def edit
    @members_project = MembersProject.find(params[:id])
  end

  # POST /members_projects
  # POST /members_projects.json
  def create
    @members_project = MembersProject.new(params[:members_project])

    respond_to do |format|
      if @members_project.save
        format.html { redirect_to @members_project, :notice => 'Members project was successfully created.' }
        format.json { render :json => @members_project, :status => :created, :location => @members_project }
      else
        format.html { render :action => "new" }
        format.json { render :json => @members_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members_projects/1
  # PUT /members_projects/1.json
  def update
    @members_project = MembersProject.find(params[:id])

    respond_to do |format|
      if @members_project.update_attributes(params[:members_project])
        format.html { redirect_to @members_project, :notice => 'Members project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @members_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members_projects/1
  # DELETE /members_projects/1.json
  def destroy
    @members_project = MembersProject.find(params[:id])
    @members_project.destroy

    respond_to do |format|
      format.html { redirect_to members_projects_url }
      format.json { head :no_content }
    end
  end
end
