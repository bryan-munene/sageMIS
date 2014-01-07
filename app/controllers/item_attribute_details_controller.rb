class ItemAttributeDetailsController < ApplicationController
  # GET /item_attribute_details
  # GET /item_attribute_details.json
  def index
    @item_attribute_details = ItemAttributeDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_attribute_details }
    end
  end

  # GET /item_attribute_details/1
  # GET /item_attribute_details/1.json
  def show
    @item_attribute_detail = ItemAttributeDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_attribute_detail }
    end
  end

  # GET /item_attribute_details/new
  # GET /item_attribute_details/new.json
  def new
    @item_attribute_detail = ItemAttributeDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_attribute_detail }
    end
  end

  # GET /item_attribute_details/1/edit
  def edit
    @item_attribute_detail = ItemAttributeDetail.find(params[:id])
  end

  # POST /item_attribute_details
  # POST /item_attribute_details.json
  def create
    @item_attribute_detail = ItemAttributeDetail.new(params[:item_attribute_detail])

    respond_to do |format|
      if @item_attribute_detail.save
        format.html { redirect_to @item_attribute_detail, notice: 'Item attribute detail was successfully created.' }
        format.json { render json: @item_attribute_detail, status: :created, location: @item_attribute_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @item_attribute_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_attribute_details/1
  # PUT /item_attribute_details/1.json
  def update
    @item_attribute_detail = ItemAttributeDetail.find(params[:id])

    respond_to do |format|
      if @item_attribute_detail.update_attributes(params[:item_attribute_detail])
        format.html { redirect_to @item_attribute_detail, notice: 'Item attribute detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_attribute_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_attribute_details/1
  # DELETE /item_attribute_details/1.json
  def destroy
    @item_attribute_detail = ItemAttributeDetail.find(params[:id])
    @item_attribute_detail.destroy

    respond_to do |format|
      format.html { redirect_to item_attribute_details_url }
      format.json { head :no_content }
    end
  end
end
