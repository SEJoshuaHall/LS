# def alphabetic_number_sort(range_nums)
#   int_to_alpha_numbers = ((0..19).to_a.zip(['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'])).to_h
#   range_nums.sort {|a, b| int_to_alpha_numbers[a] <=> int_to_alpha_numbers[b]}
# end

NUMBER_WORDS =  %w(zero one two three four
                five six seven eight nine
                ten eleven twelve thirteen fourteen
                fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(num_range)
  num_range.sort_by {|number| NUMBER_WORDS[number]}  
end


p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]