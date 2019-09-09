RSpec.feature 'Visit lists page', type: :feature do
  let(:user) { create(:user) }

  before(:each) do |scenario|
    sign_in user unless scenario.metadata[:sign_out]
    visit '/lists'
  end

  scenario 'user not registered try to access the list path', :sign_out do
    expect(page).to have_content('Log in')
  end

  scenario 'user view list index' do
    expect(page).to have_content("New List")
  end

  scenario 'user creates a list' do
    FactoryBot.create(:list)
    expect(page).to have_content('List was successfully created.')
  end

  scenario 'user want to delete a list' do
    click_button 'Destroy'
    expect(page).to have_content('List was destroyed successfully!')
  end

end