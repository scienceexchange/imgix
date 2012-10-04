module Imgix
  class Style
    attr_reader :name, :options
    
    def initialize(name, attachment, options = {})
      @name       = name
      @attachment = attachment
      @options    = options
      
      if @options.is_a?(Hash)
        @options = @options.delete_if {|o| ![:h, :w, :crop, :fit, :bg].include?(o) }
      end
    end
    
    def to_s
      @options.to_param
    end
  end
end