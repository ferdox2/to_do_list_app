RSpec.feature 'Sign in page', type: :feature do
  let(:user) { create(:user) }

  before(:each) do |scenario|
    sign_in user if scenario.metadata[:sign_in]
    visit '/users/sign_in'
  end

  scenario 'When a user click on: sign up' do
    click_link 'Sign up'
    expect(page).to have_content('Sign up')
  end

  scenario 'When a user click on: sign up' do
    click_link 'Sign up'
    expect(page).to have_content('Sign up')
  end

  scenario 'When a valid user try to sign in' do
    fill_in 'Email',	with: user.email
    fill_in 'Password',	with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
  
  scenario 'When an unregistered user try to sign in' do
    fill_in 'Email',	with: 'whatever@test.com'
    fill_in 'Password',	with: 'jjhdjhjdhskj'
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end
end