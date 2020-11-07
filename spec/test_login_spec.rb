require 'rails_helper'
feature 'Simulating admin and user relationships' do
  background do 
    User.create(email: 'yarik@mail.ru', password: 'bratuha')
    User.create(email: 'sample@mail.ru', password: 'sample')
  end
  scenario 'Signing in admin and creating an order' do
    visit 'users/sign_in'
    within('#session') do
      fill_in 'Email', with: 'yarik@mail.ru'
      fill_in 'Password', with: 'bratuha'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    visit '/menu/new'
    expect(page).to have_content 'You can add your course here'
  end
  scenario 'Signing in as another user' do
    visit '/users/sign_in'
    within('#session') do
      fill_in 'Email', with: 'sample@mail.ru'
      fill_in 'Password', with: 'sample'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    visit '/menu/new'
    expect(page).to have_content 'You are not allowed to do this'
  end
  scenario 'Adding an element and checking it in a main menu' do
    visit 'users/sign_in'
    within('#session') do
      fill_in 'Email', with: 'yarik@mail.ru'
      fill_in 'Password', with: 'bratuha'
    end
    click_button 'Log in'
    visit '/items/new'
    within('#itemf') do
      fill_in 'Name', with: 'Sample dish'
      fill_in 'Price', with: '14'
      select 'First course', :from => 'item[d_type]'
    end
    click_button 'Add'
    expect(page).to have_content 'Successfully added a menu item'
    visit '/weekday/menu/' + Menu.last.id.to_s
    expect(page).to have_content 'Sample dish'
    within('#ordert') do
      select 'Sample dish', :from => 'order[first_id]'
    end
    click_button 'Create an order'
    expect(page).to have_content 'We will process your order as fast as we can'
  end
end
