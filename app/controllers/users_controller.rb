class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    if current_user
      redirect_to :controller => "presentations", :action => "index", :notice => 'User was successfully created.'
    else
      @user = User.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @user }
      end
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        @user.notegroups << Notegroup.first if Notegroup.first
        format.html { redirect_to :controller => "presentations", :action => "index", :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

def logout
  @current_user = nil
  RubyCAS::Filter.logout(self)
end


private
  def current_user
    @current_user ||= (
    if session[:cas_user]
      if User.find_by_login(session[:cas_user])
        User.find_by_login(session[:cas_user])
      else
        #redirect_to :controller=>'users', :action => 'new'
        #User.create(:login => session[:cas_user])
      end
    else
      nil
    end)
  end


private
def skip_login?
    true
end

end
