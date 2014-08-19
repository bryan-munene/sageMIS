class SaleItemsController < ApplicationController
  # GET /sale_items
  # GET /sale_items.json
  def index
    #@sale_items = SaleItem.all
    if params[:search]
     @sale_items = Item.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])
    Rails.logger.debug "#{@sale_items.inspect}"
    else
      @sale_items = SaleItem.all
    end
    Rails.logger.debug "#{@sale_items.inspect}"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sale_items }
    end
  end

  # GET /sale_items/1
  # GET /sale_items/1.json
  def show
    @sale_item = SaleItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale_item }
    end
  end

  # GET /sale_items/new
  # GET /sale_items/new.json
  def new
    
    @sale_item = SaleItem.new
    @current_sales = SaleItem.in_progress
    @sale = Sale.new
    @saleserrors = []
    if params[:error]
      #add these errors to the current sales form
      @saleserrors = params[:error]
    end
    #Rails.logger.debug "#{@current_sales.inspect}"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale_item }
    end
  end

  # GET /sale_items/1/edit
  def edit
    @sale_item = SaleItem.find(params[:id])
  end

  # POST /sale_items
  # POST /sale_items.json
  def create
    @sale_item = SaleItem.new(params[:sale_item])
    @sale_item.newitem(params[:sale_item])

    respond_to do |format|
      if @sale_item.save
        format.html { redirect_to new_sale_item_path, notice: 'Sale item was successfully posted.' }
        format.json { render json: @sale_item, status: :created, location: @sale_item }
      else
        format.html { render action: "new" }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sale_items/1
  # PUT /sale_items/1.json
  def update
    @sale_item = SaleItem.find(params[:id])

    respond_to do |format|
      if @sale_item.update_attributes(params[:sale_item])
        format.html { redirect_to @sale_item, notice: 'Sale item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1
  # DELETE /sale_items/1.json
  def destroy
    @sale_item = SaleItem.find(params[:id])
    @sale_item.destroy

    respond_to do |format|
      format.html { redirect_to new_sale_item_path }
      format.json { head :no_content }
    end
  end
end
