require 'rails_helper'

RSpec.feature 'tasks page of a list', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    FactoryBot.create(:list)
    visit list_tasks_path
  end

  scenario 'view page without tasks' do
    expect(page).to have_content('New List')
  end

  scenario 'user creates a task' do
    FactoryBot.create(:task)
    expect(page).to have_content('Task was successfully created.')
  end

  scenario 'destroy task' do
    FactoryBot.create(:task)
    click_button 'Destroy'
    expect(page).to have_content('Task was destroyed')
  end

  scenario 'edit task' do
    FactoryBot.create(:task)
    click_button 'Edit'
    expect(page).to have_content('Edit task')
  end
end
