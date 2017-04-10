require 'fluent_validation/validators/not_nil_validator'
require 'fluent_validation/validators/not_empty_validator'
require 'fluent_validation/validators/length_validator'
require 'fluent_validation/validators/exact_length_validator'
require 'fluent_validation/validators/email_validator'
require 'fluent_validation/validators/less_than_validator'
require 'fluent_validation/validators/less_than_or_equal_validator'
require 'fluent_validation/validators/greater_than_validator'
require 'fluent_validation/validators/greater_than_or_equal_validator'
require 'fluent_validation/validators/regular_expression_validator'
require 'fluent_validation/validators/predicate_validator'
require 'fluent_validation/validators/child_collection_validator_adaptor'

module FluentValidation
  class RuleBuilder
    def initialize(attribute_rule)
      @attribute_rule = attribute_rule
    end

    def not_nil
      validator = Validators::NotNilValidator.new
      @attribute_rule.add_validator validator
      self
    end

    def not_empty
      validator = Validators::NotEmptyValidator.new
      @attribute_rule.add_validator validator
      self
    end

    def length(min, max)
      validator = Validators::LengthValidator.new(min, max)
      @attribute_rule.add_validator validator
      self
    end

    def exact_length(length)
      validator = Validators::ExactLengthValidator.new(length)
      @attribute_rule.add_validator validator
      self
    end

    def email_address
      validator = Validators::EmailValidator.new
      @attribute_rule.add_validator validator
      self
    end

    def less_than(comparison_value)
      validator = Validators::LessThanValidator.new(comparison_value)
      @attribute_rule.add_validator validator
      self
    end

    def less_than_or_equal(comparison_value)
      validator = Validators::LessThanOrEqualValidator.new(comparison_value)
      @attribute_rule.add_validator validator
      self
    end

    def greater_than(comparison_value)
      validator = Validators::GreaterThanValidator.new(comparison_value)
      @attribute_rule.add_validator validator
      self
    end

    def greater_than_or_equal(comparison_value)
      validator = Validators::GreaterThanOrEqualValidator.new(comparison_value)
      @attribute_rule.add_validator validator
      self
    end

    def matches(regexp)
      validator = Validators::RegularExpressionValidator.new(regexp)
      @attribute_rule.add_validator validator
      self
    end

    def must(&expression)
      validator = Validators::PredicateValidator.new(expression)
      @attribute_rule.add_validator validator
      self
    end

    def set_collection_validator(validator)
      validator_adaptor = Validators::ChildCollectionValidatorAdaptor.new validator
      @attribute_rule.add_validator validator_adaptor
      self
    end

    def with_name(name)
      @attribute_rule.attribute_name = name
      self
    end

    def with_error_code(error_code)
      @attribute_rule.error_code = error_code
      self
    end

    def when(&expression)
      @attribute_rule.condition = expression
      self
    end
  end
end