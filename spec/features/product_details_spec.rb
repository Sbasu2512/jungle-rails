require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  #! SETUP
  before :each do
    @category= Category.create! name: 'Apparel'

    10.times do
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: Faker::Number.number(digits:2),
        price: Faker::Number.decimal(l_digits:2),
      )
    end
  end
end
