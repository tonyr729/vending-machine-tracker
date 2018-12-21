require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    
    visit machine_path(dons)
    
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  
  scenario 'they see the name and price of all of the snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    snack_1 = Snack.create(name: "Snickers", price: 1)
    snack_2 = Snack.create(name: "Resses", price: 2)
    snack_3 = Snack.create(name: "M&M", price: 1)
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2, snack_3])

    visit machine_path(dons)
    
    expect(page).to have_content("Snickers $1")
    expect(page).to have_content("Resses $2")
    expect(page).to have_content("M&M $1")
  end
end
