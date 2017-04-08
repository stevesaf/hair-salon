require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a new stylist', {:type => :feature}) do
    it('allows a boss to click a stylist to see the clients for them') do
      visit('/')
      click_link('Add New Stylist')
      fill_in('name', :with =>'Guy Hairdeux')
      click_button('Add Stylist')
      expect(page).to have_content('Success!')
    end
  end
