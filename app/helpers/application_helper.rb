module ApplicationHelper
# Returns a human friendly format of the time stamp
  # Origin: http://snippets.dzone.com/posts/show/6229
  def time_ago(from_time, to_time = Time.now)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_minutes = (((to_time - from_time).abs)/60).round
    distance_in_seconds = ((to_time - from_time).abs).round
    case distance_in_minutes
      when 0..1           then time = (distance_in_seconds < 60) ? "#{distance_in_seconds} #{t('timestamps.seconds_ago')}" : "1 #{t('timestamps.minute_ago')}"
      when 2..59          then time = "#{distance_in_minutes} #{t('timestamps.minutes_ago')}"
      when 60..90         then time = "1 #{t('timestamps.hour_ago')}"
      when 90..1440       then time = "#{(distance_in_minutes.to_f / 60.0).round} #{t('timestamps.hours_ago')}"
      when 1440..2160     then time = "1 #{t('timestamps.day_ago')}" # 1-1.5 days
      when 2160..2880     then time = "#{(distance_in_minutes.to_f / 1440.0).round} #{t('timestamps.days_ago')}" # 1.5-2 days
      #else time = from_time.strftime(t('date.formats.default'))
    end
    if distance_in_minutes > 2880
      distance_in_days = (distance_in_minutes/1440.0).round
      case distance_in_days
        when 0..30    then time = "#{distance_in_days} #{t('timestamps.days_ago')}"
        when 31..364  then time = "#{(distance_in_days.to_f / 30.0).round} #{t('timestamps.months_ago')}"
        else               time = "#{(distance_in_days.to_f / 365.24).round} #{t('timestamps.years_ago')}"
      end
    end
    
    return time
  end
  def presentable_date(utc_time_stamp, working_locale = Time.now)
    #convert the timestamp to a formate easy for the user
    return utc_time_stamp.to_date if !utc_time_stamp.nil?
  end
  
  def batch_display(remaining,original)
    if original==0
      return 0
    else
     return ((remaining/original)*100).to_i
    end
  end
  
  def stock_display(item_id)
    @batches = Batch.find_all_by_item_id(item_id)
    total_batch_items = 0.0
    total_remaining = 0.0
    remain_percent = 0
    counter_batches =0 
    if @batches && @batches.size > 0
      
       @batches.each do |batch| 
        total_batch_items = total_batch_items+ batch.no_of_items.to_f
        total_remaining = total_remaining+batch.remaining_items.to_f
        counter_batches= counter_batches+1
      end 
        #compute the percentage
        remain_percent= ((total_remaining/total_batch_items)*100).to_i
        
        return {:r_percent=>remain_percent,:counter=>counter_batches,:total_remaining=>total_remaining,:total=>total_batch_items}
    else
      #code
      return {:r_percent=>remain_percent,:counter=>counter_batches,:total_remaining=>total_remaining,:total=>total_batch_items}
    end
  end
  def display_batch_level_color(level)
    bar = ""
    case level
      when Settings.batch_below_limit.to_i..Settings.batch_mid_limit.to_i-1           then bar = "progress-bar-danger"
      when Settings.batch_mid_limit.to_i..Settings.batch_OK_limit-1          then bar = "progress-bar-warning"
      when Settings.batch_OK_limit.to_i..100         then bar = "progress-bar-success"
      #else time = from_time.strftime(t('date.formats.default'))
    end
    return bar
  end
  def display_product_level_color(level)
    bar = ""
    case level
      when Settings.product_below_limit.to_i..Settings.product_mid_limit.to_i-1           then bar = "progress-bar-danger"
      when Settings.product_mid_limit.to_i..Settings.product_OK_limit-1          then bar = "progress-bar-warning"
      when Settings.product_OK_limit.to_i..100         then bar = "progress-bar-success"
      #else time = from_time.strftime(t('date.formats.default'))
    end
    return bar
  end
  def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
