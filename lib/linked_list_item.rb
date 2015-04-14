class LinkedListItem
  include Comparable
  #should look into this "comparable"

  # def initialize(payload)
  # end
  ## test 1

  # def payload
  # end
  ## test 2





  attr_accessor :payload, :next_item ##test 4

  def initialize(payload, next_item = nil)
  	@payload = payload  ##test 3
  	@next_item = next_item
  end

end
