require 'rails_helper'

RSpec.describe Order do

  before(:all) {
    @category = Category.new
    @category.save!
    @name = "Prabhu"
  }

  before(:each) do
    puts "Runs before each Example"
  end

  before(:all) do
    puts "Runs before all Examples"
  end

  describe "GRP-1" do

    it 'TC1' do
      puts 'Running the first Example'
    end

    it 'TC2' do
      puts 'Running the second Example'
    end
  end

  describe "GRP-2" do

    it 'TC3' do
      puts 'Running the third Example'
    end

    it 'TC4' do
      puts 'Running the fourth Example'
    end
  end

  describe 'GRP-3' do
    context 'name test context' do
      before(:all) do
        @name = "Test"
      end

      it 'tc-1' do
        puts 'tc-1', @name
      end

      it 'tc-2' do
        puts 'tc-2' , @name
      end
    end
  end

  describe 'GRP-4' do
    it 'tc-1' do
      puts @name
    end
  end
end

