class SubunitsController < ApplicationController
  # GET /subunits
  # GET /subunits.json
  def index
    @subunits = Subunit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subunits }
    end
  end

  # GET /subunits/1
  # GET /subunits/1.json
  def show
    @subunit = Subunit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subunit }
    end
  end

  # GET /subunits/new
  # GET /subunits/new.json
  def new
    @subunit = Subunit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subunit }
    end
  end

  # GET /subunits/1/edit
  def edit
    @subunit = Subunit.find(params[:id])
  end

  # POST /subunits
  # POST /subunits.json
  def create
    @subunit = Subunit.new(params[:subunit])

    respond_to do |format|
      if @subunit.save
        format.html { redirect_to @subunit, notice: 'Subunit was successfully created.' }
        format.json { render json: @subunit, status: :created, location: @subunit }
      else
        format.html { render action: "new" }
        format.json { render json: @subunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subunits/1
  # PUT /subunits/1.json
  def update
    @subunit = Subunit.find(params[:id])

    respond_to do |format|
      if @subunit.update_attributes(params[:subunit])
        format.html { redirect_to @subunit, notice: 'Subunit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subunits/1
  # DELETE /subunits/1.json
  def destroy
    @subunit = Subunit.find(params[:id])
    @subunit.destroy

    respond_to do |format|
      format.html { redirect_to subunits_url }
      format.json { head :no_content }
    end
  end
end
