module CoreExtensions
  module Array
    module DeepFreeze
      def deep_freeze!
        each_value{|val| val.deep_freeze! if val.respond_to?(:deep_freeze!) }
        freeze
      end
    end
  end
end

Array.include CoreExtensions::Array::DeepFreeze
