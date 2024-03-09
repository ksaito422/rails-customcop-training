# frozen_string_literal: true

module CustomCops
  # `array.any?` is a simplified way to say `!array.empty?`
  #
  # @example
  #   # bad
  #   !array.empty?
  #
  #   # good
  #   array.any?
  #
  class SimplifyNotEmptyWithAny < RuboCop::Cop::Base
    extend RuboCop::Cop::AutoCorrector

    MSG = 'ダメです！'
    RESTRICT_ON_SEND = [:!].freeze

    def_node_matcher :not_empty_call?, <<~PATTERN
      (send (send $(...) :empty?) :!)
    PATTERN

    def on_send(node)
      expression = not_empty_call?(node)
      return unless expression

      add_offense(node) do |corrector|
        corrector.replace(node, "#{expression.source}.any?")
      end
    end
  end
end
