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

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'add a post'
      fill_in 'Message', with: "I'm not waiting on a lady"
      click_button 'Create Post'
      expect(page).to have_content "I'm not waiting on a lady"
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing posts' do

    before { Post.create message: "I'm not waiting on a lady" }

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link "Edit I'm not waiting on a lady"
      fill_in 'Message', with: "I'm just waiting on a friend"
      click_button 'Update Post'
      expect(page).to have_content "I'm just waiting on a friend"
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    before { Post.create message: 'paint it black' }

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete paint it black'
      expect(page).not_to have_content 'paint it black'
      expect(page).to have_content 'post deleted successfully'
    end
  end
end
