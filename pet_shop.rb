def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
 return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  return pet_shop[:admin][:pets_sold] += sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  count = []
 
  for pet in pet_shop[:pets]
    if breed == pet[:breed]
      count << pet
    end
  end
  return count
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if name == pet[:name]
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_pet_count(customers)
  return customers[:pets].length()
end

def add_pet_to_customer(customers, new_pet)
  customers[:pets] << new_pet
  return customers[:pets].count
end

def customer_can_afford_pet?(customers, new_pet)
    if customers[:cash] >= new_pet[:price]
      return true
    end
  return false
end



def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil
    return nil
  end

  can_afford = customer_can_afford_pet?(customer, pet)

  if can_afford
    customer[:pets] << pet
    pet_shop[:admin][:pets_sold] += 1
    pet_shop[:admin][:total_cash] += pet[:price]
  end

end