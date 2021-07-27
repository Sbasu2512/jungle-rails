require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They see all products" do
    #TODO: ACT
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    first("a[href='/products/10']").click
    sleep 1

    #TODO: DEBUG / VERIFY
    # save_screenshot
    #TODO: VERIFY
    
    expect(page).to have_css 'article.product-detail'
  end
end
