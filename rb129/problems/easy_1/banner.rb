class Banner
  def initialize(message, width=(nil))
    @message = message
    set_width = width ? width : message.length
    @width = set_width > message.length ? set_width : message.length 
  end
  
  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end
  
  private

  def horizontal_rule
    "+-#{"-" * (@width)}-+"
  end

  def empty_line
    "| #{" " * (@width)} |"
  end

  def message_line
    "| #{" " * ((@width - @message.length) / 2)}#{@message}#{" " * ((@width - @message.length) / 2)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 5)
puts banner
