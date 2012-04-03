class NotegroupsController < ApplicationController
  # GET /notegroups
  # GET /notegroups.json
  def index
    @notegroups = Notegroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notegroups }
    end
  end

  # GET /notegroups/1
  # GET /notegroups/1.json
  def show
    @notegroup = Notegroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notegroup }
    end
  end

  # GET /notegroups/new
  # GET /notegroups/new.json
  def new
    @notegroup = Notegroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notegroup }
    end
  end

  # GET /notegroups/1/edit
  def edit
    @notegroup = Notegroup.find(params[:id])
    @users = User.all.collect{|user| user.login} - @notegroup.users.collect{|user| user.login}
  end

  # POST /notegroups
  # POST /notegroups.json
  def create
    @notegroup = Notegroup.new(params[:notegroup])
    @notegroup.users << current_user
    respond_to do |format|
      if @notegroup.save
        format.html { redirect_to @notegroup, :notice => 'Notegroup was successfully created.' }
        format.json { render :json => @notegroup, :status => :created, :location => @notegroup }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notegroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notegroups/1
  # PUT /notegroups/1.json
  def update
    @notegroup = Notegroup.find(params[:id])
    @notegroup.users << User.find_by_login(params[:notegroup][:users_to_add]) unless params[:notegroup][:users_to_add].empty?

    respond_to do |format|
      if @notegroup.update_attributes(params[:notegroup])
        format.html { redirect_to(:action => "edit", :notice => 'Notegroup was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notegroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notegroups/1
  # DELETE /notegroups/1.json
  def destroy
    @notegroup = Notegroup.find(params[:id])
    @notegroup.destroy

    respond_to do |format|
      format.html { redirect_to notegroups_url }
      format.json { head :ok }
    end
  end
end
