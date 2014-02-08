class ItemattributesController < ApplicationController
  # GET /itemattributes
  # GET /itemattributes.json
  def index
    @itemattributes = Itemattribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itemattributes }
    end
  end

  # GET /itemattributes/1
  # GET /itemattributes/1.json
  def show
    @itemattribute = Itemattribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itemattribute }
    end
  end

  # GET /itemattributes/new
  # GET /itemattributes/new.json
  def new
    @itemattribute = Itemattribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itemattribute }
    end
  end

  # GET /itemattributes/1/edit
  def edit
    @itemattribute = Itemattribute.find(params[:id])
  end

  # POST /itemattributes
  # POST /itemattributes.json
  def create
    @itemattribute = Itemattribute.new(params[:itemattribute])

    respond_to do |format|
      if @itemattribute.save
        format.html { redirect_to @itemattribute, notice: 'Itemattribute was successfully created.' }
        format.json { render json: @itemattribute, status: :created, location: @itemattribute }
      else
        format.html { render action: "new" }
        format.json { render json: @itemattribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itemattributes/1
  # PUT /itemattributes/1.json
  def update
    @itemattribute = Itemattribute.find(params[:id])

    respond_to do |format|
      if @itemattribute.update_attributes(params[:itemattribute])
        format.html { redirect_to @itemattribute, notice: 'Itemattribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itemattribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemattributes/1
  # DELETE /itemattributes/1.json
  def destroy
    @itemattribute = Itemattribute.find(params[:id])
    @itemattribute.destroy

    respond_to do |format|
      format.html { redirect_to itemattributes_url }
      format.json { head :no_content }
    end
  end
end
