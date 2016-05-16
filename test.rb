#please do not grade this. i am using this to test my code.
require 'chronic'
def test1(a,b=nil)
	puts a
	puts "love" if b
end

test1(3)

def format_date(date1=nil)
  	date1 = Chronic.parse(date1) if date1.kind_of?(Date) == false
  	return date1
end

puts format_date("in 5 weeks")