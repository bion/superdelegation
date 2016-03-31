require 'rails_helper'

feature 'Visiting a url for an unsupported state' do
  before do
    Delegate.create! \
      state: 'WA',
      position: "Governor",
      name: "Jay Inslee",
      klass: "Delegates::WA::Inslee"
  end

  scenario 'redirecting back to home page' do
    visit '/ZZ'

    expect(page).to have_content('select your state from the list')
    expect(current_path).to eq(root_path)
  end
end
