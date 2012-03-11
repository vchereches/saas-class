# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1} 
  @@currencies_from_dollar = {'yen' => 76.92, 'euro' => 0.773, 'dollar' => 1.00, 'rupee' => 52.63}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(new_currency)
    singular_new_currency = new_currency.to_s.gsub(/s$/, '')
    if @@currencies_from_dollar.has_key?(singular_new_currency)
      self * @@currencies_from_dollar[singular_new_currency]
    end
  end
end



class String
  def palindrome?
	self.gsub!(/\W/,'')
	return self.downcase == self.reverse.downcase
  end 
end

class Enumerator
  include Enumerable
  def palindrome?
    self.to_a.palindrome?
  end
end

class Hash
  def palindrome?
    return true
  end
end

class Range
  def palindrome?
    p self.to_a == self.to_a.reverse
  end
end

class Object
  def palindrome?
    return self
  end
end

class Array
   def palindrome?
      self.reverse == self
   end
end

