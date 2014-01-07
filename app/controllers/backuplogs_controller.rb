class BackuplogsController < ApplicationController
  # GET /backuplogs
  # GET /backuplogs.json
  def index
    @backuplogs = Backuplog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @backuplogs }
    end
  end

  # GET /backuplogs/1
  # GET /backuplogs/1.json
  def show
    @backuplog = Backuplog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @backuplog }
    end
  end

  # GET /backuplogs/new
  # GET /backuplogs/new.json
  def new
    @backuplog = Backuplog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @backuplog }
    end
  end

  # GET /backuplogs/1/edit
  def edit
    @backuplog = Backuplog.find(params[:id])
  end

  # POST /backuplogs
  # POST /backuplogs.json
  def create
    @backuplog = Backuplog.new(params[:backuplog])

    respond_to do |format|
      if @backuplog.save
        format.html { redirect_to @backuplog, notice: 'Backuplog was successfully created.' }
        format.json { render json: @backuplog, status: :created, location: @backuplog }
      else
        format.html { render action: "new" }
        format.json { render json: @backuplog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /backuplogs/1
  # PUT /backuplogs/1.json
  def update
    @backuplog = Backuplog.find(params[:id])

    respond_to do |format|
      if @backuplog.update_attributes(params[:backuplog])
        format.html { redirect_to @backuplog, notice: 'Backuplog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @backuplog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backuplogs/1
  # DELETE /backuplogs/1.json
  def destroy
    @backuplog = Backuplog.find(params[:id])
    @backuplog.destroy

    respond_to do |format|
      format.html { redirect_to backuplogs_url }
      format.json { head :no_content }
    end
  end
end
