module StimulusReflexGlobalid
  class Engine < ::Rails::Engine
    isolate_namespace StimulusReflexGlobalid

    config.to_prepare do
      StimulusReflex::Reflex.class_eval do
        unless instance_methods.include?(:original_initialize)
          alias_method :original_initialize, :initialize

          def initialize(channel, url: nil, element: nil, selectors: [], method_name: nil, permanent_attribute_name: nil, params: {})
            original_initialize(channel, url: url, element: element, selectors: selectors, method_name: method_name, permanent_attribute_name: permanent_attribute_name, params: params)

            @element.dataset.to_h.each do |k, v|
              if (model = GlobalID::Locator.locate(v) || GlobalID::Locator.locate_signed(v))
                instance_variable_set(:"@#{k}", model)
              end
            end
          end
        end
      end
    end
  end
end
