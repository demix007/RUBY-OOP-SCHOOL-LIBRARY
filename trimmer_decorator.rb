require './base_decorator'

class TrimmerDecorator < BaseDecorator
    def initialize(nameable)
        super()
        @nameable   = nameable
    end
end