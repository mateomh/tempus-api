require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it '1. Checks validations for precense of the name field' do
    u = User.create(name: nil)
    expect(u).to be_invalid
  end

  it '2. Checks validations for uniqueness of the name field' do
    User.create(name: 'testy')
    u = User.create(name: 'testy')
    expect(u).to be_invalid
  end

  it '3. Checks the task model association' do
    User.create(name: 'testy')
    test_user = User.first
    Category.create(name: 'test group')
    test_category = Category.first

    Task.create({ user_id: test_user.id, category_id: test_category.id, desc: 'RSPEC Task', time: 2.5 })
    test_task = test_user.tasks.first

    expect(test_task.desc).to eql('RSPEC Task') # be 'RSPEC Task'
  end
end
