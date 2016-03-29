require 'rails_helper'

feature "Sending message to WA state delegates" do
  scenario "the form is correctly filled in" do
    visit delegates_path

    fill_in "First name", with: "Jeff"
    fill_in "Last name", with: "Bridges"
    fill_in "Address1", with: "1234 Dude Lane"
    fill_in "City", with: "Los Angeles"
    fill_in "Zip", with: "90210"
    fill_in "Email", with: "jeff@thedude.com"
    fill_in "Phone", with: "2125550011"
    fill_in "Contents", with: "You suck!!!!!!!!!!"

    click_on "Send Message"

    expect(page).to have_content("You successfully let them know")

    expect(SendMessageJob).to have_been_enqueued
      .with({ "_aj_globalid" => /Message/ }, "Delegates::WA::Inslee")
  end

  scenario "invalid form submission" do
    visit delegates_path

    fill_in "First name", with: "Jeff"
    fill_in "Last name", with: "Bridges"
    fill_in "Address1", with: "1234 Dude Lane"
    fill_in "City", with: "Los Angeles"
    fill_in "Zip", with: "90210"
    fill_in "Email", with: "jeff@thedude.com"
    fill_in "Phone", with: "2125550011"

    click_on "Send Message"

    expect(page).to have_content("Contents can't be blank")
  end
end
