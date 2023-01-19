require './base_decorator'

class CapitalizeDecorator < BaseDecorator
    def initialize(nameable)
        super()
        @nameable = nameable
    end
end