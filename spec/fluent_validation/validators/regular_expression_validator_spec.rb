require 'fluent_validation/validators/regular_expression_validator'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'
require 'fluent_validation/validators/attribute_validator_context'

RSpec.describe FluentValidation::Validators::RegularExpressionValidator  do
  before(:each) do
    @validator = FluentValidation::Validators::RegularExpressionValidator.new(/^Ruby/)
  end

  it 'should return failure when given incorrect value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Description', 'xRuby is excellent')
    validation_failures = @validator.validate(context)
    expect(validation_failures.first.class).to eq(FluentValidation::Results::ValidationFailure)
  end

  it 'should return success when given correct value' do
    context = FluentValidation::Validators::AttributeValidatorContext.new('Description', 'Ruby is excellent')
    validation_failures = @validator.validate(context)
    expect(validation_failures.length).to eq(0)
  end
end