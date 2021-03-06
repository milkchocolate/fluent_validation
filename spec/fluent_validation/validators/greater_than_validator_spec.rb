require 'fluent_validation/validators/greater_than_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'
require 'fluent_validation/validators/attribute_validator_context'

RSpec.describe FluentValidation::Validators::GreaterThanValidator  do
  before(:each) do
    @validator = FluentValidation::Validators::GreaterThanValidator.new(5)
  end

  it 'should return failure when given incorrect value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Scale', 5)
    validation_failures = @validator.validate(context)
    expect(validation_failures[0].class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Scale', 6)
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end