module Imgix
  module ViewHelpers
    def self.included(base)
      base.send(:attr_accessor, :image, :options)
    end

    def imgix_tag(object, style, html_options = {})
      image_tag(object.url(style), html_options)
     end
  end
end