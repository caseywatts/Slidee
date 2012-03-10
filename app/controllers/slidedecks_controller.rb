class SlidedecksController < ApplicationController
  # GET /slidedecks
  # GET /slidedecks.json
  def index
    @slidedecks = Slidedeck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slidedecks }
    end
  end

  # GET /slidedecks/1
  # GET /slidedecks/1.json
  def show
    @slidedeck = Slidedeck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slidedeck }
    end
  end

  # GET /slidedecks/new
  # GET /slidedecks/new.json
  def new
    @slidedeck = Slidedeck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @slidedeck }
    end
  end

  # GET /slidedecks/1/edit
  def edit
    @slidedeck = Slidedeck.find(params[:id])
  end

  # POST /slidedecks
  # POST /slidedecks.json
  def create
    @slidedeck = Slidedeck.new(params[:slidedeck])

    respond_to do |format|
      if @slidedeck.save
        format.html { redirect_to @slidedeck, :notice => 'Slidedeck was successfully created.' }
        format.json { render :json => @slidedeck, :status => :created, :location => @slidedeck }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slidedeck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slidedecks/1
  # PUT /slidedecks/1.json
  def update
    @slidedeck = Slidedeck.find(params[:id])

    respond_to do |format|
      if @slidedeck.update_attributes(params[:slidedeck])
        format.html { redirect_to @slidedeck, :notice => 'Slidedeck was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slidedeck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slidedecks/1
  # DELETE /slidedecks/1.json
  def destroy
    @slidedeck = Slidedeck.find(params[:id])
    @slidedeck.destroy

    respond_to do |format|
      format.html { redirect_to slidedecks_url }
      format.json { head :ok }
    end
  end
end
