require 'fluent_validation/validators/length_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'

RSpec.describe FluentValidation::Validators::LengthValidator  do
  before(:each) do
    @validator = FluentValidation::Validators::LengthValidator.new(1, 20)
  end

  it 'should return failure when given incorrect value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('First Name', '')
    validation_failures = @validator.validate(context)
    expect(validation_failures.first.class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('First Name', 'James')
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end