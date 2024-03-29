require 'spec_helper'

feature 'Deleting Tickets' do
  let!(:project) {FactoryGirl.create(:project)}
  let!(:ticket) { FactoryGirl.create(:ticket, :project => project)}

  before do
    visit '/'
    click_link project.name
    click_link ticket.title
  end

  scenario "Deleting a ticket" do
    click_link "Delete Ticket"
    page.should have_content "Ticket has been deleted."
    page.current_url.should == project_url(project)
  end
end