class TaxcodesController < ApplicationController
  # GET /taxcodes
  # GET /taxcodes.json
  def index
    @taxcodes = Taxcode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taxcodes }
    end
  end

  # GET /taxcodes/1
  # GET /taxcodes/1.json
  def show
    @taxcode = Taxcode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxcode }
    end
  end

  # GET /taxcodes/new
  # GET /taxcodes/new.json
  def new
    @taxcode = Taxcode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taxcode }
    end
  end

  # GET /taxcodes/1/edit
  def edit
    @taxcode = Taxcode.find(params[:id])
  end

  # POST /taxcodes
  # POST /taxcodes.json
  def create
    @taxcode = Taxcode.new(params[:taxcode])

    respond_to do |format|
      if @taxcode.save
        format.html { redirect_to @taxcode, notice: 'Taxcode was successfully created.' }
        format.json { render json: @taxcode, status: :created, location: @taxcode }
      else
        format.html { render action: "new" }
        format.json { render json: @taxcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taxcodes/1
  # PUT /taxcodes/1.json
  def update
    @taxcode = Taxcode.find(params[:id])

    respond_to do |format|
      if @taxcode.update_attributes(params[:taxcode])
        format.html { redirect_to @taxcode, notice: 'Taxcode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @taxcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxcodes/1
  # DELETE /taxcodes/1.json
  def destroy
    @taxcode = Taxcode.find(params[:id])
    @taxcode.destroy

    respond_to do |format|
      format.html { redirect_to taxcodes_url }
      format.json { head :no_content }
    end
  end
end
