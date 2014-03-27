module Imgix
  class Attachment
    attr_reader :name, :instance, :options

    def initialize(name, instance, params = {})
      @params   = self.class.default_options.merge(params)
      @name     = name.present? ? name : @params[:default]
      @instance = instance
    end

    def url(style = nil)
      base_url      = "#{Imgix.options[:protocol]}://#{@instance.options[:subdomain]}.#{Imgix.options[:base_url]}"

      full_url      = [base_url, @instance.options[:prefix], file_name].compact.join("/")

      if style.present? && @params[:styles].include?(style.to_sym)
        [full_url, styles[style.to_sym].to_s].join("?")
      else
        full_url
      end
    end

    def file_name
      @instance.send("#{@name}_file_name")
    end

    def content_type
      @instance.send("#{@name}_content_type")
    end

    def file_size
      @instance.send("#{@name}_file_size")
    end

    def default_style
      @options[:default_style]
    end

    def styles
      @normalized_styles = @params[:styles].dup
      @normalized_styles.each_pair do |name, options|
        @normalized_styles[name.to_sym] = Imgix::Style.new(name, self, options.dup)
      end

      @normalized_styles
    end

    def self.default_options
      @default_options ||= {
        :default_style  => :original,
        :styles         => {}
      }
    end
  end
end