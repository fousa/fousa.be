class Hash
    def to_struct class_name = nil
        klass =
            unless class_name
                Struct.new *keys.map{ |key| key.to_sym }
            else
                Struct.new class_name.to_s, *keys.map{ |key| key.to_sym }
            end
        klass.new *values
    end
end