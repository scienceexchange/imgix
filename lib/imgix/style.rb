module Imgix
  class Style
    attr_reader :name, :options

    def initialize(name, attachment, options = {})
      @name       = name
      @attachment = attachment
      @options    = options
    end

    def to_s
      @options.to_param
    end
  end
end