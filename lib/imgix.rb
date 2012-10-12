require 'erb'

require 'imgix/version'
require 'imgix/style'
require 'imgix/attachment'
require 'imgix/attachment_options'
require 'imgix/instance_methods'
require 'imgix/view_helpers/imgix_tag'

module Imgix
  def self.options
    @options ||= {
      :protocol   => "https",
      :base_url   => "imgix.net"
    }
  end
  
  module ClassMethods
    def has_imgix_attachment(name, options = {})
      include InstanceMethods
      
      class_attribute :options
      self.options = options
      
      define_method(name) do |*args|
        a = attachment_for(name)
        (args.length > 0) ? a.to_s(args.first) : a
      end

      define_method "#{name}=" do |file|
        attachment_for(name).assign(file)
      end

      define_method "#{name}?" do
        attachment_for(name).file?
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Imgix::ClassMethods)
ActionView::Base.send(:include, Imgix::ViewHelpers)