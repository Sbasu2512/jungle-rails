require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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

    #TODO: DEBUG / VERIFY
    save_screenshot
    #TODO: VERIFY
    expect(page).to have_css 'article.product', count: 10

  end
end
