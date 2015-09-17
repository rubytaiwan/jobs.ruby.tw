require "rails_helper"

RSpec.feature "View individual job pages" do
  scenario "as a guest" do
    job = create(:job)

    visit job_path(job)

    expect(page).not_to have_css("span.manage")
  end

  scenario "as a guest and somehow job loses its owner" do
    job = double(:job, owner: nil)

    visit job_path(job)

    expect(page).not_to have_css("span.manage")
  end
end
