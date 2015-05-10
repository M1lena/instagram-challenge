require 'rails_helper'

feature 'posts' do
  context 'no posts
 have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts
    '
      expect(page).to have_content 'no posts yet'
      expect(page).to have_link 'add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(message: "I'm not waiting on a lady")
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content("I'm not waiting on a lady")
      expect(page).not_to have_content('No posts yet')
    end
  end
end