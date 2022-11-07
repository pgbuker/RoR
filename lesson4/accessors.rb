# frozen_string_literal: true

module Accessors
  module ClassMethods
    def attr_accessor_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "@#{name}_history".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}_history".to_sym) { instance_variable_get(var_name_history) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name_history, [instance_variable_get(var_name)]) if instance_variable_get(var_name_history).nil?
          instance_variable_set(var_name_history, instance_variable_get(var_name_history).push(value))
          instance_variable_set(var_name, value)
        end
      end
    end

    def strong_attr_accessor(name, class_name)
      define_method(name) { instance_variable_get("@#{name}".to_sym) }
      define_method("#{name}=".to_sym) do |value|
        raise "Неправильно указан тип переменной! #{value}: #{value.class}" unless value.class.to_s == class_name.to_s

        instance_variable_set("@#{name}".to_sym, value)
      end
    end
  end
end
