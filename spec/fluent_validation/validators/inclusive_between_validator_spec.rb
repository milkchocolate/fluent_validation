require 'fluent_validation/validators/inclusive_between_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'

RSpec.describe FluentValidation::Validators::InclusiveBetweenValidator  do
  before(:each) do
    @validator = FluentValidation::Validators::InclusiveBetweenValidator.new(1, 3)
  end

  it 'should return failure when given incorrect value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Type', 4)
    validation_failures = @validator.validate(context)
    expect(validation_failures.first.class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Type', 1)
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end