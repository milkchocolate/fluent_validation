require 'fluent_validation/fluent_validator'

RSpec.describe FluentValidation::FluentValidator do
  it 'should return failures given nil value' do
    dto = {name: nil}
    validator = FluentValidation::FluentValidator.new
    validator.rule_for(&->(dto) { dto[:name] }).not_nil
    validation_result = validator.validate dto

    expect(false).to eq(validation_result.is_valid?)
  end

  it 'should return failures given empty string value' do
    dto = {name: ''}
    validator = FluentValidation::FluentValidator.new
    validator.rule_for(&->(dto) { dto[:name] }).not_empty
    validation_result = validator.validate dto

    expect(false).to eq(validation_result.is_valid?)
  end

  it 'should return failures given empty array value' do
    dto = {cars: Array.new}
    validator = FluentValidation::FluentValidator.new
    validator.rule_for(&->(dto) { dto[:cars] }).not_empty
    validation_result = validator.validate dto

    expect(false).to eq(validation_result.is_valid?)
  end

  it 'should return failures given empty value in array' do
    dto = {cars: [{name: ''}]}

    car_validator = FluentValidation::FluentValidator.new
    car_validator.rule_for(&->(car) { car[:name] }).not_empty

    dto_validator = FluentValidation::FluentValidator.new
    dto_validator.rule_for(&->(dto) { dto[:cars] }).not_empty.set_collection_validator(car_validator)

    validation_result = dto_validator.validate dto
    expect(false).to eq(validation_result.is_valid?)
  end
end