require 'rails_helper'

RSpec.describe Order do

  before(:all) {
    @category = Category.new
    @category.save!
  }

  before(:each) do
    puts "Runs before each Example"
  end

  before(:all) do
    puts "Runs before all Examples"
  end

  describe "GRP-1" do

    it 'TC1' do
      cat = @category
      puts cat
      puts 'Running the first Example'
    end

    it 'TC2' do
      cat = @category
      puts cat
      puts 'Running the second Example'
    end
  end

  describe "GRP-2" do

    it 'TC3' do
      cat = @category
      puts cat
      puts 'Running the third Example'
    end

    it 'TC4' do
      cat = @category
      puts cat
      puts 'Running the fourth Example'
    end
  end

end

