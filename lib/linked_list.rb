require_relative 'linked_list_item'

class LinkedList
  attr_reader :size

  def initialize(*args)
    @size = 0
    args.each do |payload|
    	self.push(payload)
    end
  end

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

	def to_s
    str = "| "
    current_item = @first_item
    until current_item.nil?
      str << current_item.payload
      punctuation = current_item.last? ? " " : ", "
      str << punctuation
      current_item = current_item.next_item
    end
    str << "|"
    str
  end

  def get(index)
    raise IndexError, "yeah something" if index < 0 || index > @size
    if index == 0
      @first_item.payload
    else
      @current_node = @first_item
      index.times do
        @current_node = @current_node.next_item
      end
      @current_node.payload
    end
  end
  alias [] get

  def push(payload)
    new_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = new_item
      @last_item = @first_item
    else
      @last_item.next_item = new_item
      @last_item = @last_item.next_item
    end
    #@last_item = new_item
    @size += 1
  end
end
