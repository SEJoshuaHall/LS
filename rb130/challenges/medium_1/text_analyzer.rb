
class TextAnalyzer
  def process
    file = File.open("sample.txt")
    file_data = file.read
    yield(file_data)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |data| puts data.split(/\s\s/).count }
analyzer.process { |data| puts data.split(/\n/).count }
analyzer.process { |data| puts data.split(/\s/).count }