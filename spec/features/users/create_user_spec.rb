require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit 'users/new'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'Email', with: 'kobe2@lakers.com'
    fill_in 'Name', with: 'kobe2'
    fill_in 'Password', with:  'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Join'
    last_user = User.last
    puts "rspec....last_user = :#{last_user.inspect}"
    expect(current_path).to eq("/users/#{last_user.id}")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'Join'
    expect(current_path).to eq('/users/new')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end