# using 'keyword style' arguments
def mymethod(required_arg, args={})
  do_fancy_stuff if args[:fancy]
end

mymethod "foo",:fancy => true # => args={:fancy => true}
mymethod "foo"                # => args={}

# using * (splat) arguments
def mymethod(required_arg, *args)
  # args is an array of extra args, maybe empty
end

mymethod "foo","bar",:fancy => true # => args=["bar",{:fancy=>true}]
mymethod "foo"                      # => args=[]

def do_fancy_stuf
	print "Here"
end
