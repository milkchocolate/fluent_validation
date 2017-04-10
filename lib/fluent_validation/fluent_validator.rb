require 'fluent_validation/attribute_rule'
require 'fluent_validation/rule_builder'
require 'fluent_validation/results/validation_failure'
require 'fluent_validation/results/validation_success'
require 'fluent_validation/results/validation_result'

module FluentValidation
  class FluentValidator
    def initialize
      @attribute_rules = Array.new
    end

    def rule_for(&expression)
      rule = AttributeRule.new(&expression)
      @attribute_rules << rule
      RuleBuilder.new(rule)
    end

    def validate(object)
      failures = Array.new

      @attribute_rules.each do |rule|
        result = rule.validate object
        failures.concat result if result.class != Results::ValidationSuccess
      end

      Results::ValidationResult.new failures
    end
  end
end