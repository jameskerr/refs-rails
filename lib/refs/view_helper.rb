class Refs
  module ViewHelper
    def ref = Refs.instance

    def self.included(base)
      base.helper_method :ref
    end
  end
end
