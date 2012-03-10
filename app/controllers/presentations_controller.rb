class PresentationsController < ApplicationController
  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @presentations }
    end
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @presentation }
    end
  end

  # GET /presentations/new
  # GET /presentations/new.json
  def new
    @presentation = Presentation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @presentation }
    end
  end

  # GET /presentations/1/edit
  def edit
    @presentation = Presentation.find(params[:id])
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(params[:presentation])
    @presentation.update_attributes(:course => Course.last) #maybe this should be a hidden field in the form

    respond_to do |format|
      if @presentation #.save
        format.html { redirect_to @presentation, :notice => 'Presentation was successfully created.' }
        format.json { render :json => @presentation, :status => :created, :location => @presentation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @presentation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /presentations/1
  # PUT /presentations/1.json
  def update
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      if @presentation.update_attributes(params[:presentation])
        format.html { redirect_to @presentation, :notice => 'Presentation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @presentation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.destroy

    respond_to do |format|
      format.html { redirect_to presentations_url }
      format.json { head :ok }
    end
  end

  def create_slides
    require 'RMagick'
    include Magick
    #@presentation.slidedeck ---this ought to work but doesn't yet - I must've messed up relationships?
    #@presentation
    #slides = ImageList.new(Slidedeck.last.deck.url)
    slides = ImageList.new("app/assets/ST_Training_-_Week_7.pdf")
    slides.each { |slide|
      Slide.create(:presentation => @presentation)
    }
  end

end
