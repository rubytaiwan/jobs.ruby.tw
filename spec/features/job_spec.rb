# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'View individual job pages' do
  background do
    @job = build_job
  end

  scenario 'as a guest' do
    visit job_path(@job)
    expect(page).to_not have_css('span.manage')
  end

  scenario 'as a guest and somehow job loses its owner' do
    @job.update_attribute(:owner, nil)
    visit job_path(@job)
    expect(page).to_not have_css('span.manage')
  end
end
