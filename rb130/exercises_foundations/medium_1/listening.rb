class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      record(yield)
    end
  end

  def play
    @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
p listener.play # Outputs "Hello World!"