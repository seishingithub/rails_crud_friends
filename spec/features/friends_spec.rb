require 'spec_helper'

feature 'Manage Friends' do
  scenario 'User can create and view list of friends' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add friend'
    fill_in 'First name', with: 'Fred'
    fill_in 'Last name', with: 'Williams'
    click_on 'Create friend'
    expect(page).to have_content 'Fred'
    expect(page).to have_content 'Williams'
  end
end