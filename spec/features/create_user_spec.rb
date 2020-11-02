# frozen_string_literal: true

require 'rails_helper'

describe "the login process", type: :feature do
  include_context 'When authenticated'

  it "creates user" do
    visit '/users'
    click_link('Users')
    click_link('New User')
    within("#new_user") do
      fill_in 'Name', with: 'John'
      fill_in 'Last name', with: 'Doe'
      fill_in 'Email', with: 'user2@example.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
    end
    click_button 'Create User'
    expect(page).to have_css("p#notice", text: "User was successfully created.")
    expect(User.find_by(email: 'user2@example.com').as_json(except: %i[created_at id updated_at])).to eq({"email"=>"user2@example.com", "last_name"=>"Doe", "name"=>"John"})
  end

  it "does not create invalid user" do
    visit '/users'
    click_link('Users')
    click_link('New User')
    within("#new_user") do
      fill_in 'Name', with: 'John'
      fill_in 'Last name', with: 'Doe'
      fill_in 'Email', with: 'user2@example.com'
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '456'
    end
    click_button 'Create User'
    expect(page).to have_css("div#error_explanation h2", text: "2 errors prohibited this user from being saved:")
    expect(page).to have_css("div#error_explanation ul li", text: "Password is too short (minimum is 6 characters)")
    expect(page).to have_css("div#error_explanation ul li", text: "Password confirmation doesn't match Password")
    expect(User.all.size).to eq(1)
  end
end
