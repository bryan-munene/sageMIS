class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
       is_import = params[:type]

    if is_import=="1"
     render :action=>"import_spreadsheet"
    else

      @item = Item.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @item }
      end
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, item: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, item: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
  def import_spreadsheet

    if request.post?
      #Get the damn file and process it if it set
      if params[:data_file]
        #process the file
        uploaded_io = params[:data_file]
        Rails.logger.debug{"file noted. lets process it"}
        #File.open(Rails.root.join('public', 'data', uploaded_io.original_filename), 'w') do |file|
        #file.write(uploaded_io.read)
        #end
        #filename = params[:file_name]
        require 'csv'
        file = uploaded_io.tempfile
        #infile = params[:file].read
        count = 0
        CSV.foreach(file) do |row|
          # use row here...
          count = count + 1

          old_item_number = row[0].to_s.encode('utf-8', :invalid => :replace)
          name = row[1].to_s.encode('utf-8', :invalid => :replace)
          description = row[2].to_s.encode('UTF-8', :invalid => :replace)
          attribute =row[3].to_s.encode('UTF-8', :invalid => :replace)
          size = row[4].to_s.encode('UTF-8', :invalid => :replace)
          regular_price = row[5].to_f
          dosage = row[6].to_s.encode('UTF-8', :invalid => :replace)
          manufacturer = row[7].to_s.encode('UTF-8', :invalid => :replace)
          source = row[8].to_s.encode('UTF-8', :invalid => :replace)
          is_import = true
          if count==1
            #ignore this row as it is the header row
          else
            item = {:old_item_number=>old_item_number,:cvs_import=>is_import,:item_name=>name,:item_description=>description,:item_attribute=>attribute,:size=>size,:original_price=>regular_price,:dosage=>dosage,:manufacturer=>manufacturer,:source=>source}
            @item = Item.new(item)
            if !@item.save
              Rails.logger.error{"Failed Creating the item"}
              Rails.logger.error{@item}
            end
          end
        end

        flash[:notice]="Successfully imported #{count-1} records"
        redirect_to items_path and return
      else
        #display the import form
        Rails.logger.debug{uploaded_io.inspect}
        render "import_spreadsheet"
      end
    end

  end
end
