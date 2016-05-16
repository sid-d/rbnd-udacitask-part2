class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    options[:title] = "Untitled List" if !options[:title]
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    case type
    when "todo"
      @items.push TodoItem.new(description, options)
    when "event"
      @items.push EventItem.new(description, options)
    when "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::AddUnsupportedItem , "You added an item that is not supported"
    end
  end

  def delete(index)
    if @items.count < index
      raise UdaciListErrors::DeleteUnavailableItem , "The item is not available"
    end
    @items.delete_at(index - 1)
  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

  def filter(item_type)
    new_items = @items.select {|item| item.item_type[0] == item_type}
    if new_items
      new_items.each {|item| puts item.item_type[1]}
    else
      puts "There is nothing to show here."
    end
  end

  def change_priority(index,new_priority)
    if @items[index-1].item_type[0] == "todo"
      @items[index-1].priority = new_priority
    else
      puts "Can't change priority since it's not a todo item"
    end
  end
end
