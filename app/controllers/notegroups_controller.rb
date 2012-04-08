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
    #require 'etherpad-lite'
    @ether = EtherpadLite.connect('http://slideeetherpad.cloudfoundry.com', 'HwcKLaD2oyADLbX6ZO8ZgA719Du9NA17')
    @notegroup = Notegroup.find(params[:id])
    @group = @ether.group("my_app_group_#{@notegroup.id}")
    #@pads = @group.pads
    # Map the user to an EtherpadLite Author
    author = @ether.author("my_app_user_#{current_user.id}", :name => current_user.fullname)

    ## Get or create a two hour long session for this Author in this Group
    #session[:ep_sessions] ||= {} #this should just happen during login
    #sess = session[:ep_sessions][@group.id] ? ether.get_session(session[:ep_sessions][@group.id]) : @group.create_session(author, 120)
    #if sess.expired?
      #sess.delete
      #sess = @group.create_session(author, 60)
    #end
    #session[:ep_sessions][@group.id] = sess.id
    ## Set the EtherpadLite session cookie. This will automatically be picked up by the jQuery plugin's iframe.
    #cookies[:sessionID] = {:value => sess.id, :domain => "afternoon-dawn-1379.herokuapp.com"}
    file_name = File.basename(@notegroup.presentation.deckoriginal_file_name, File.extname(@notegroup.presentation.deckoriginal_file_name));

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notegroup }
      format.pdf do
        render :pdf           => file_name,
               :layout        => 'pdf.html', # use 'pdf.html' for a pdf.html.erb file
               :show_as_html  => params[:debug].present?,
               :page_size     => 'letter'
               #:exe_path => "/usr/bin/wkhtmltopdf"
               #:wkhtmltopdf   => "/usr/bin/wkhtmltopdf" # path to binary

      end
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
