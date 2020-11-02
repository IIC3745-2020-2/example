When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the login form$/) do
  expect(page).to have_css("h2", text: "Log in")
  expect(page).to have_css("form input#user_email")
  expect(page).to have_css("form input#user_password")
end
