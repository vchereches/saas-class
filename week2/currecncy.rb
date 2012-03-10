# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1} 
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(method)
	self.dollars.send ("#{method}")
  end
end

def palindrome?(input)
	input.gsub!(/\W/,'')
	return input.downcase == input.reverse.downcase
end

class String
  def method_missing(method_id)
   if (method_id.to_s == "palindrome?")
      palindrome?(self)
   else
	super
   end
  end
end

class Array
   def palindrome?
      self.reverse == self
   end
end

5.rupees.in(:yen)
