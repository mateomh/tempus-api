require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) do
    User.delete_all
    Task.delete_all
    Category.delete_all
    
    @test_user = User.create(name: 'testy')
    Category.create(name: 'test category')
    @test_category = Category.first
  end

  it '1. Checks the precense validation for the description field' do
    t = Task.create(desc: nil, time: 2.5, user_id: @test_user.id, category_id: @test_category.id)
    expect(t).to be_invalid
  end

  it '2. Checks the number validation for the time field' do
    t = Task.create(desc:'Rspec Task', time: 'hola', user_id: @test_user.id, category_id: @test_category.id)
    expect(t).to be_invalid
  end

  it '3. Checks the creation of the task' do
    t = Task.create(desc:'Rspec Task', time: 2.5, user_id: @test_user.id, category_id: @test_category.id)
    expect(t).to be_valid
  end

  it '4. Checks the association with the user model and category model' do
    t = Task.create(desc:'Rspec Task', time: 2.5, user_id: @test_user.id, category_id: @test_category.id)
    expect(t.user).to be_valid
    expect(t.category).to be_valid
  end
end
