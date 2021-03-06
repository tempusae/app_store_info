module AppStoreInfo
  module JSONAccessors
    def self.included(base)
      base.extend ClassMethods
    end

    def read_json_accessors(json)
      self.class.accessors.each do |field, json_field|
        instance_variable_set("@#{field}", json[json_field])
      end
    end

    module ClassMethods
      def json_accessors(json_accessors)
        json_accessors.map { |field, _| attr_reader field }

        @_json_accessors = json_accessors
      end

      def accessors
        @_json_accessors
      end
    end
  end
end
