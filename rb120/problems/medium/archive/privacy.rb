class Machine
  def start
    flip_switch(:on)
  end
  
  def stop
    flip_switch(:off)
  end

  def switch_state
    @switch
  end
  
  private
  
  attr_accessor :switch
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

mach = Machine.new
mach.start
p mach.switch_state