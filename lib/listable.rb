module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(25)
  end

  def format_priority(priority)

    if priority == "high"
    	value = " ⇧".colorize(:red)
    elsif priority == "medium"
    	value = " ⇨".colorize(:green)
    elsif priority == "low"
    	value = " ⇩".colorize(:blue)
    elsif !priority
    	value = ""
   	else
   		raise UdaciListErrors::InvalidPriority , "The priority is not valid"
   	end
   	return value
  end

  def format_date(date1=nil,date2=nil)
  	dates = date1.strftime("%D") if date1
    dates << " -- " + date2.strftime("%D") if date2
    dates = "N/A" if !dates
    return dates
  end
end