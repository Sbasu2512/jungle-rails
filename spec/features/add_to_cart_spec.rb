require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "test if the cart is being updated or not" do
    #TODO: Act: Go to the homepage 
    visit root_path
    #TODO: Verify: if products are being displayed or not
    expect(page).to have_css 'article.product', count: 10
    #TODO: Act: Click on the button
    first('button i.fa-shopping-cart').click
    #TODO: Wait: Wait till the page reloads
    sleep 1
    #TODO: Verify: Check if the cart is updated or not
    expect(find('nav ul.navbar-right')).to have_text 'My Cart (1)'
  end
end
