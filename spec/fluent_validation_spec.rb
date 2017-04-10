require 'spec_helper'
require 'fluent_validation/fluent_validator'

RSpec.describe FluentValidation do
  it 'has a version number' do
    expect(FluentValidation::VERSION).not_to be nil
  end
end
