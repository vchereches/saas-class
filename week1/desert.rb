class Dessert
def initialize(name, calories=0)
	@name = name
	@calories = calories
end
attr_accessor :name
attr_accessor :calories
def healthy?
	calories <= 200
end
def delicious?
	return true
end
end
class JellyBean < Dessert
def initialize(name, calories, flavor)
	@name = name
	@calories = calories
	@flavor = flavor
end
attr_accessor :flavor
def delicious?
	if flavor == "black licorice" 
		return false
	else
		return true
	end
end
end

