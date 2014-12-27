class UsersTeamsController < ApplicationController
  # GET /users_teams
  # GET /users_teams.json
  def index
    @users_teams = UsersTeam.all(:order => :team_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users_teams }
    end
  end

  # GET /users_teams/1
  # GET /users_teams/1.json
  def show
    @users_team = UsersTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @users_team }
    end
  end

  # GET /users_teams/new
  # GET /users_teams/new.json
  def new
    @users_team = UsersTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @users_team }
    end
  end

  # GET /users_teams/1/edit
  def edit
    @users_team = UsersTeam.find(params[:id])
  end

  # POST /users_teams
  # POST /users_teams.json
  def create
    @users_team = UsersTeam.new(params[:users_team])

    respond_to do |format|
      if @users_team.save
        format.html { redirect_to @users_team, :notice => 'Users team was successfully created.' }
        format.json { render :json => @users_team, :status => :created, :location => @users_team }
      else
        format.html { render :action => "new" }
        format.json { render :json => @users_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users_teams/1
  # PUT /users_teams/1.json
  def update
    @users_team = UsersTeam.find(params[:id])

    respond_to do |format|
      if @users_team.update_attributes(params[:users_team])
        format.html { redirect_to @users_team, :notice => 'Users team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @users_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users_teams/1
  # DELETE /users_teams/1.json
  def destroy
    @users_team = UsersTeam.find(params[:id])
    @users_team.destroy

    respond_to do |format|
      format.html { redirect_to users_teams_url }
      format.json { head :no_content }
    end
  end
end
