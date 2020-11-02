RSpec.shared_context 'When authenticated' do
  before do
    create(:user, email: 'user@example.com')
    authenticate
  end

  def authenticate
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
  end
end
