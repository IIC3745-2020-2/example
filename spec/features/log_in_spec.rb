# frozen_string_literal: true

require 'rails_helper'

describe "the login process", type: :feature do
  before :each do
    create(:user, email: 'user@example.com')
  end

  it "logs me in" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_css("p#notice", text: "Signed in successfully.")
  end

  it "dows not logs me in" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'fake@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_css("p#alert", text: "Invalid Email or password.")
  end
end
