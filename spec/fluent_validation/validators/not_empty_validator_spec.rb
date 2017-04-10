require 'fluent_validation/validators/attribute_validator_context'
require 'fluent_validation/validators/not_empty_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'

RSpec.describe FluentValidation::Validators::NotEmptyValidator  do
  before(:each) do
    @validator = FluentValidation::Validators::NotEmptyValidator.new
  end

  it 'should return failure when given empty string value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Name', '')
    validation_failures = @validator.validate(context)
    expect(validation_failures.first.class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return failure when given empty array value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Properties', Array.new)
    validation_failures = @validator.validate(context)
    expect(validation_failures.first.class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct string value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Name', 'Stark')
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end

  it 'should return success when given correct array value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Properties', ['Car' 'House'])
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end