


class TextAnalyzer
  def process
    file = File.new('sample.txt').read
    yield(file)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts file }
analyzer.process { |file| puts "#{file.split(/\n\n/).count} paragraphs"  }
analyzer.process { |file| puts "#{file.split(/\n/).count} lines" }
analyzer.process { |file| puts "#{file.split(/\s/).count} words" }
