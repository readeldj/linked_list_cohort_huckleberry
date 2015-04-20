require_relative 'linked_list_item'

class LinkedList
    attr_reader :size
	# def size # same thing as AttrReader
	# 	@size
	# end
	def initialize(*args)
		@size = 0
		@more_stuff = *args
	end

	def last
		unless @last_item.nil?
			@last_item.payload
		end
	end

	# def last  # this was my way, it worked, but not as pretty.
	# 	if @size == 0
	# 		@last
	# 	else
	# 	    @last = get(@size - 1)
	# 	end
	# end

	def to_s
		if @first_item.nil?
		    to_s = "| |"
		else
			to_s = "| #{@stuff} |"
		end
	end

	# def to_s
	# 	if @first_item.nil?
	# 	    str = "| |"
	# 	else
	# 		str = "| "
	# 		@size.times do |i|
	# 		    str << get(i)
	# 		    if i != 0
	# 		        str << ", "
	# 		    end
	# 		end
	# 		str << " |"
	# 	end
	# 	str
	# end

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

	def push(payload)
		new_item = LinkedListItem.new(payload)
	    if @first_item.nil?
		  @first_item = new_item
		  @last_item = @first_item
		  @stuff = @last_item.payload
		else
			@last_item.next_item = new_item
			@last_item = @last_item.next_item
            @stuff += ", " + @last_item.payload
		end
		#@last_item = new_item
		@size += 1
	end
end
