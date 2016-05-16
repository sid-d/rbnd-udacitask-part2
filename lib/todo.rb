class TodoItem
  include Listable
  attr_reader :description, :due
  attr_accessor :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def details
    format_description(@description) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end

  def item_type
    return ["todo",@description]
  end
end
