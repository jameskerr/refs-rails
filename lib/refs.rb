class Refs
  def self.ref(name)
    define_method(name) { name.to_s }
  end

  def self.define(&block)
    class_eval(&block) if block_given?
  end

  def self.instance
    @instance ||= new
  end
end
