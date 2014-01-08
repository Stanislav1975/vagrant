shared_context "capability_helpers" do
  def detect_class(result)
    Class.new do
      define_method(:detect?) do
        result
      end
    end
  end

  def cap_instance(name, options=nil)
    options ||= {}

    Class.new do
      if !options[:corrupt]
        define_method(name) do |*args|
          raise "cap: #{name} #{args.inspect}"
        end
      end
    end.new
  end
end
