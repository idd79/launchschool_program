# Alyssa created the following code to keep track of items for a shopping cart
# application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    # quantity = updated_count if updated_count >= 0
    @quantity = updated_count if updated_count >= 0
  end
end

# Alan looked at the code and spotted a mistake. "This will fail when
# update_quantity is called", he says.

# Can you spot the mistake and how to address it?

# The mistake is that the instance variable quantity will not be updated through
# the method update_quantity as it not being called approprietly. We should add
# a @ infront of it inside the method. Keep in mind that the method call will
# not fail or give an error, it will just fail to update the variable quantity.

new_item = InvoiceEntry.new('new', 10)
p new_item.quantity
new_item.update_quantity(15)
p new_item.quantity
