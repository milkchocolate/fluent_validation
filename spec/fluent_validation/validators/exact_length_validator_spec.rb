require 'fluent_validation/validators/exact_length_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'

RSpec.describe FluentValidation::Validators::ExactLengthValidator  do
  before(:each) do
    @validator = FluentValidation::Validators::ExactLengthValidator.new(5)
  end

  it 'should return failure when given incorrect value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Code', '4321')
    validation_failures = @validator.validate(context)
    expect(validation_failures[0].class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Code', '54321')
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end