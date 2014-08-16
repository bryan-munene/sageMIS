class ReportsController < ApplicationController
  def index
    #code
    "Reports set up is pending"
  end
  def daily_sales
    #displays the sales report for the day selected,if params are null,today's sales are assumed
    if request.post?
      #get params and display the sale report
      @dailysales = Sale.sale_per_range(params[:report_date_from],params[:report_date_to])
      
    #else
      #display the form
    end
    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @dailysales }
      end
    
    
  end
  def current_day_sales(args)
    #code
  end  
end
