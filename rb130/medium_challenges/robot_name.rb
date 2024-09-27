class Robot
  attr_reader :name
  @@used_names = []

  def initialize
    get_name
  end

  def reset
    get_name
  end

  private

  def get_name
    @name = ''
    loop do
      2.times do
        @name << ('A'..'Z').to_a.shuffle.first
      end
      
      3.times do
        @name << ('0'..'9').to_a.shuffle.first
      end

      break unless @@used_names.include?(@name)
    end
    @@used_names << @name
  end
end
