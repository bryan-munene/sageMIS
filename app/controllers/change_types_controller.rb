class ChangeTypesController < ApplicationController
  # GET /change_types
  # GET /change_types.json
  def index
    @change_types = ChangeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @change_types }
    end
  end

  # GET /change_types/1
  # GET /change_types/1.json
  def show
    @change_type = ChangeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @change_type }
    end
  end

  # GET /change_types/new
  # GET /change_types/new.json
  def new
    @change_type = ChangeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @change_type }
    end
  end

  # GET /change_types/1/edit
  def edit
    @change_type = ChangeType.find(params[:id])
  end

  # POST /change_types
  # POST /change_types.json
  def create
    @change_type = ChangeType.new(params[:change_type])

    respond_to do |format|
      if @change_type.save
        format.html { redirect_to @change_type, notice: 'Change type was successfully created.' }
        format.json { render json: @change_type, status: :created, location: @change_type }
      else
        format.html { render action: "new" }
        format.json { render json: @change_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /change_types/1
  # PUT /change_types/1.json
  def update
    @change_type = ChangeType.find(params[:id])

    respond_to do |format|
      if @change_type.update_attributes(params[:change_type])
        format.html { redirect_to @change_type, notice: 'Change type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @change_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_types/1
  # DELETE /change_types/1.json
  def destroy
    @change_type = ChangeType.find(params[:id])
    @change_type.destroy

    respond_to do |format|
      format.html { redirect_to change_types_url }
      format.json { head :no_content }
    end
  end
end
