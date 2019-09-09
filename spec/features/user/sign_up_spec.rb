RSpec.feature 'Sign up page', type: :feature do
  let(:user) { create(:user) }
  before(:each) do |scenario|
    sign_in user if scenario.metadata[:sign_in]
    visit '/users/sign_up'
  end

  scenario 'register with valid data' do
    fill_in 'Email',	with: 'whatever@test.com'
    fill_in 'Password',	with: '123456'
    fill_in 'Password confirmation',	with: '123456'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'register with no valid data' do
    fill_in 'Email',	with: 'whatever@test.com'
    fill_in 'Password',	with: '123'
    fill_in 'Password confirmation',	with: '123'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short')
  end

  scenario 'click on sign in link' do
    click_link 'Log in'
    expect(page).to have_content('Log in')
  end

end