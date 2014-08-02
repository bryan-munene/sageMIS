class SearchController < ApplicationController
  def search
    #search for a product
    if request.post?
      q = params[:search]
      if q.to_s.length > 0
        @items = Item.searchb(q)
        if @items && @items.size==0
          @msg = "No products match your search key word"
        end
        
     end
    end
    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @item }
      end
    
  end
end
