class AjaxController < ApplicationController
  def items
    if params[:item]
      q = params[:search]
      like= "%".concat(q.concat("%"))
      @items = Item.searchb(q)
    else
      @items = Item.all
    end
    list = @items.map {|i| Hash[ id: i.id, label: i.item_name, name: i.item_name]}
    render json: list
  end
end
