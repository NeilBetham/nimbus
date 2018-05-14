# Mixin for building Service objects
module Service
  extend ActiveSupport::Concern

  included do
    # Instantiates and calls the service object
    #
    # @param agrs [Array<Object>] The params to be passed along to the service object instance
    # @return [void] Returns are defined by the individual Service objects
    def self.call(*args)
      new(*args).call
    end
  end
end
