require "pry"
#
# [{"TEMPEH"=>{:price=>3.0, :clearance=>true}},
#  {"PEANUTBUTTER"=>{:price=>3.0, :clearance=>true}},
#  {"ALMONDS"=>{:price=>9.0, :clearance=>false}}]

# result = consolidate_cart(cart)
# expect(result["AVOCADO"][:price]).to eq(3.00)
# expect(result["AVOCADO"][:clearance]).to eq(true)
# expect(result["AVOCADO"][:count]).to eq(2)
#
# expect(result["KALE"][:price]).to eq(3.00)
# expect(result["KALE"][:clearance]).to eq(false)
# expect(result["KALE"][:count]).to eq(1)
# end

def consolidate_cart(cart)
  new_hash = {}
   cart.each do |item|
     item.each do |name, attributes|
      if attributes[:count] == nil
        attributes[:count] = 1
        new_hash[name] = attributes
      else
        attributes[:count] += 1
      end
   end
  end
  new_hash
end

# coupons [{:item=>"AVOCADO", :num=>2, :cost=>5.0}]
# cart = "AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>2}}
def apply_coupons(cart, coupons)
  discount= {}
  cart.each do |item|
    item.each do |name, attributes|
      coupons.each do |coupon|
        if coupon[:item] == name
          discount["#{name} W/COUPON"] = {:price => coupon[:cost] }
          binding.pry
        end
      end
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
