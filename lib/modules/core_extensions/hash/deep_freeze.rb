module CoreExtensions
  module Hash
    module DeepFreeze
      def deep_freeze!
        each_value{|val| val.deep_freeze! if val.respond_to?(:deep_freeze!) }
        freeze
      end
    end
  end
end

Hash.include CoreExtensions::Hash::DeepFreeze
