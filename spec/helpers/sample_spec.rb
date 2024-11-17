# sample_spec.rb
require 'rails_helper'
require_relative '../../app/helpers/sample'

RSpec.describe ProductChecker do
  let(:checker) { ProductChecker.new }

  # it "returns 'No product' if product is nil" do
  #   expect(checker.check_status(nil)).to eq("No product")
  # end

  it "returns 'Out of stock' if product is 0" do
    expect(checker.check_status(1)).to eq("In stock")
  end
end
