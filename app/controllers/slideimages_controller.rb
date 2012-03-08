class SlideimagesController < ApplicationController
  # GET /slideimages
  # GET /slideimages.json
  def index
    @slideimages = Slideimage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slideimages }
    end
  end

  # GET /slideimages/1
  # GET /slideimages/1.json
  def show
    @slideimage = Slideimage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slideimage }
    end
  end

  # GET /slideimages/new
  # GET /slideimages/new.json
  def new
    @slideimage = Slideimage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @slideimage }
    end
  end

  # GET /slideimages/1/edit
  def edit
    @slideimage = Slideimage.find(params[:id])
  end

  # POST /slideimages
  # POST /slideimages.json
  def create
    @slideimage = Slideimage.new(params[:slideimage])

    respond_to do |format|
      if @slideimage.save
        format.html { redirect_to @slideimage, :notice => 'Slideimage was successfully created.' }
        format.json { render :json => @slideimage, :status => :created, :location => @slideimage }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slideimage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slideimages/1
  # PUT /slideimages/1.json
  def update
    @slideimage = Slideimage.find(params[:id])

    respond_to do |format|
      if @slideimage.update_attributes(params[:slideimage])
        format.html { redirect_to @slideimage, :notice => 'Slideimage was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slideimage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slideimages/1
  # DELETE /slideimages/1.json
  def destroy
    @slideimage = Slideimage.find(params[:id])
    @slideimage.destroy

    respond_to do |format|
      format.html { redirect_to slideimages_url }
      format.json { head :ok }
    end
  end
end
