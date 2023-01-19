class Nameable
    def correct_name
        raise NotImplementedError, "The implementation of the method #{__method__} in the class #{self.class} was not successful!"
    end
end