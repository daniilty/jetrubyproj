require "rails_helper"
feature "Checking if the first user is admin" do
  background do
    User.create(email: 'user@example.com', password: 'sample')
    User.create(email: 'sample@sample.com', password: 'sample')
  end
  scenario "Testing first user admin" do
    expect(User.first).to have_attributes(is_adm: true)
  end
  scenario "Testing another user super privileges" do
    expect(User.last).not_to have_attributes(is_adm: true)
  end
end
