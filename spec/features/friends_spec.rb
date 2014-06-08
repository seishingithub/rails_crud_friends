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

  scenario 'User can edit and update list of friends' do
    visit '/'
    click_on 'Add friend'
    fill_in 'First name', with: 'Fred'
    fill_in 'Last name', with: 'Williams'
    click_on 'Create friend'
    expect(page).to have_content 'Fred'
    expect(page).to have_content 'Williams'
    click_on 'Fred'
    expect(page).to have_content 'Fred'
    expect(page).to have_content 'Williams'
    click_on 'Edit friend'
    fill_in 'First name', with: 'Sarah'
    fill_in 'Last name', with: 'Bryant'
    click_on 'Update friend'
    expect(page).to have_content 'Sarah'
    expect(page).to have_content 'Bryant'
    expect(page).to have_no_content 'Fred'
    expect(page).to have_no_content 'Williams'

  end
end