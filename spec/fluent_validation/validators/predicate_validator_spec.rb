require 'fluent_validation/validators/predicate_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'
require 'fluent_validation/validators/attribute_validator_context'

RSpec.describe FluentValidation::Validators::PredicateValidator do
  before(:each) do
    expression = ->(value){ value==1 };
    @validator = FluentValidation::Validators::PredicateValidator.new(expression)
  end

  it 'should return failure when given incorrect value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Type', 2)
    validation_failures = @validator.validate(context)
    expect(validation_failures.first.class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Type', 1)
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end