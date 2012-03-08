def count_words(input)
	words = input.downcase.split(/[^a-zA-Z]/i) - ['']
	hash=Hash.new(0) 
	words.each { |word| hash[word] += 1 }
	return hash	
end

count_words("A man, a plan, a canal -- Panama")
count_words("Doo bee doo bee doo") 
