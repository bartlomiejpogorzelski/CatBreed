# spec/features/quiz_spec.rb
require 'rails_helper'

RSpec.describe 'Quizzes', type: :feature, js: true do
  let!(:quiz1) { Quiz.create!(question: 'Question 1', choice_a: 'A', choice_b: 'B', choice_c: 'C', choice_d: 'D', correct_choice: 'A') }
  let!(:quiz2) { Quiz.create!(question: 'Question 2', choice_a: 'A2', choice_b: 'B2', choice_c: 'C2', choice_d: 'D2', correct_choice: 'B2') }

  it 'displays and navigates through quizzes' do
    visit quizzes_path
    # Capybara.default_max_wait_time = 10

    # Ensure "Question 1" appears on the initial visit
    within('.quiz') do
      expect(page).to have_text('Question 1')
    end
    expect(page).not_to have_content('Question 2')

    # Click "Next" and check for "Question 2"
    click_button 'Next'
    expect(page).to have_text('Question 2')
    expect(page).not_to have_content('Question 1')

    # Click "Back" to return to "Question 1"
    click_button 'Back'
    expect(page).to have_text('Question 1')

    # Choose an answer and ensure all options become disabled
    choose(option: 'A')
    expect(page).to have_field('answer', disabled: true)
  end

  it 'allows a user to solve quizzes and see the result' do
    visit quizzes_path
    # Capybara.default_max_wait_time = 10

    # Start with "Question 1"
    within('.quiz') do
      expect(page).to have_text('Question 1')
    end
    choose(option: 'A') # Correct option

    # Move to "Question 2" and select answer
    click_button 'Next'
    expect(page).to have_text('Question 2')
    choose(option: 'C') # Not correct
    click_button 'Finish'

    # Verify result displays correctly
    expect(page).to have_content('Your result: 1 z 2')
  end
end
