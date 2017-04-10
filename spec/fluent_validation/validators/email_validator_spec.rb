require 'fluent_validation/validators/email_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/validators/attribute_validator_context'

RSpec.describe FluentValidation::Validators::EmailValidator  do
  before(:each) do
    @validator = FluentValidation::Validators::EmailValidator.new
  end

  it 'should return failure when given incorrect value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Email', '123@abc')
    validation_failures = @validator.validate(context)
    expect(validation_failures[0].class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Email', '123@abc.com')
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end