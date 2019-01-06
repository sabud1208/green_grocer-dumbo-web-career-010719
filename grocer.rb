require "pry"
#
# [{"TEMPEH"=>{:price=>3.0, :clearance=>true}},
#  {"PEANUTBUTTER"=>{:price=>3.0, :clearance=>true}},
#  {"ALMONDS"=>{:price=>9.0, :clearance=>false}}]

def consolidate_cart(cart)
   cart.each do |item, attributes|
     item[:count] = 1
   end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
