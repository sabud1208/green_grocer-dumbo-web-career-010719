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
  new_hash= {}
  cart.each do |item, attributes|
    if coupons.any? == true
      coupons.each do |coupon|
        if coupon[:item] == item and attributes[:count] / coupon[:num] >= 1
          new_hash["#{item} W/COUPON"] = {:price => coupon[:cost], :count => attributes[:count] / coupon[:num], :clearance => attributes[:clearance]}
          new_hash[item]= {:count => attributes[:count] %= coupon[:num], :price => attributes[:price]}
         else
           new_hash[item] = attributes
        end
      end
    else
     new_hash[item] = attributes
    end
  end
  new_hash
end

def apply_clearance(cart)
  # code here
  clearance_cart = {}
  cart.each do |item, info|
    clearance_cart[item] = {}
    info.each do |datum|
      if cart[item][:clearance]
        clearance_cart[item][:price] = (cart[item][:price] * 0.80).round(2)
      else
        clearance_cart[item][:price] = cart[item][:price]
      end
      clearance_cart[item][:clearance] = cart[item][:clearance]
      clearance_cart[item][:count] = cart[item][:count]

    end
  end
  clearance_cart
end


def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  total = 0
  final_cart.each do |name, properties|
    total += properties[:price] * properties[:count]
  end
  total = total * 0.9 if total > 100
  total
end
