require 'rails_helper'

RSpec.describe Category, type: :model do
  it '1. Checks validations for the precense of the name field' do
    c = Category.create(name: nil)
    expect(c).to be_invalid
  end

  it '2. Checks validations for the uniqueness of the name field' do
    Category.create(name: 'Tests')
    c = Category.create(name: 'Tests')
    expect(c).to be_invalid
  end

  it '3. Checks the task model association' do
    User.create(name: 'testy')
    test_user = User.first
    Category.create(name: 'test group')
    test_category = Category.first

    Task.create({user_id: test_user.id, category_id: test_category.id, desc: 'RSPEC Task', time: 2.5})
    test_task = test_category.tasks.first
    
    expect(test_task.desc).to eql('RSPEC Task') #be 'RSPEC Task'
  end
end
