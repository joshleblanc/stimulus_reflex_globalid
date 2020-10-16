module StimulusReflexGlobalid
  class Engine < ::Rails::Engine
    isolate_namespace StimulusReflexGlobalid

    class << self
      mattr_accessor :allow_signed
      mattr_accessor :allow_unsigned

      self.allow_signed = true
      self.allow_signed = true
    end

    @monkey_patched = false
    config.to_prepare do
      StimulusReflex::Reflex.class_eval do

        unless @monkey_patched
          @monkey_patched = true

          alias_method :original_initialize, :initialize

          def initialize(channel, url: nil, element: nil, selectors: [], method_name: nil, permanent_attribute_name: nil, params: {})
            original_initialize(channel, url: url, element: element, selectors: selectors, method_name: method_name, permanent_attribute_name: permanent_attribute_name, params: params)

            @element.dataset.to_h.each do |k, v|
              model = nil

              model = GlobalID::Locator.locate(v) if StimulusReflexGlobalid::Engine.allow_unsigned
              model = GlobalID::Locator.locate_signed(v) if StimulusReflexGlobalid::Engine.allow_signed && !model

              instance_variable_set(:"@#{k}", model) if model
            end
          end
        end
      end
    end

    def self.configure
      yield self if block_given?
    end
  end
end
