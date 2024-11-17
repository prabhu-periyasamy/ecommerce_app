require 'rails_helper'
RSpec.describe Category, type: :model do

  before(:all) do
    @category = Category.new
    @category.save!
  end

  describe 'play_around' do
    it 'test' do
      expect(true)
    end
  end

end