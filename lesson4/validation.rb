# frozen_string_literal: true

module Validation
  module ClassMethods
    def params_of_validate
      @params_of_validate
    end

    def validate(name, method, args)
      @params_of_validate ||= []
      @params_of_validate << { attr_name: name,
                               validation_method: method,
                               option: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.params_of_validate.each do |validation|
        send(validation[:validation_method].to_sym, instance_variable_get("@#{validation[:attr_name]}".to_sym), validation[:option])
      end
    end

    def valid?
      validate!
      true
    rescue StandartError
      false
    end

    def format(value, reg_exp)
      raise  'Нeправильное название станции!' unless value =~ reg_exp
    end

    def type(value, type_class)
      raise  'Неправильный тип переменной!' unless value.instance_of?(type_class)
    end
  end
end
