class ProjectsUsersController < ApplicationController
  # GET /members_projects
  # GET /members_projects.json
  def index
    @projects_users = ProjectsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects_users }
    end
  end

  # GET /members_projects/1
  # GET /members_projects/1.json
  def show
    @projects_user = ProjectsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @projects_user }
    end
  end

  # GET /members_projects/new
  # GET /members_projects/new.json
  def new
    @projects_user = ProjectsUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @projects_user }
    end
  end

  # GET /members_projects/1/edit
  def edit
    @projects_user = ProjectsUser.find(params[:id])
  end

  # POST /members_projects
  # POST /members_projects.json
  def create
    @projects_user = ProjectsUser.new(params[:projects_user])

    respond_to do |format|
      if @projects_user.save
        format.html { redirect_to @projects_user, :notice => 'Members project was successfully created.' }
        format.json { render :json => @projects_user, :status => :created, :location => @projects_user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @projects_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members_projects/1
  # PUT /members_projects/1.json
  def update
    @projects_user = ProjectsUser.find(params[:id])

    respond_to do |format|
      if @projects_user.update_attributes(params[:projects_user])
        format.html { redirect_to @projects_user, :notice => 'Members project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @projects_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members_projects/1
  # DELETE /members_projects/1.json
  def destroy
    @projects_user = ProjectsUser.find(params[:id])
    @projects_user.destroy

    respond_to do |format|
      format.html { redirect_to members_projects_url }
      format.json { head :no_content }
    end
  end
end
