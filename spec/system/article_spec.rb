require "rails_helper"

RSpec.describe "article management system", type: :system do
  scenario "create article with empty title" do
    visit new_article_path
    within("#new_article") do
      fill_in "article_title", with: ""
      find("trix-editor").click.set(Faker::Lorem.paragraph)
      click_button "Create Article"
    end
    expect(page).to have_content("can't be blank")
  end

  scenario "create article with empty content" do
    visit new_article_path
    within("#new_article") do
      fill_in "article_title", with: Faker::Lorem.sentence
      find("trix-editor").click.set("")
      click_button "Create Article"
    end
    expect(page).to have_current_path(new_article_path)
  end

  scenario "create a valid article" do
    visit new_article_path
    within("#new_article") do
      fill_in "article_title", with: Faker::Lorem.sentence
      find("trix-editor").click.set(Faker::Lorem.paragraph)
      click_button "Create Article"
    end
    puts(article_path(Article.last))
    expect(page).to have_current_path(article_path(Article.last))
  end
end