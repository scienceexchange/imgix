require 'imgix/version'
require 'imgix/style'
require 'imgix/attachment'
require 'imgix/attachment_options'
require 'imgix/view_helpers/imgix_tag'

module Imgix
  def self.options
    @options ||= {
      :protocol   => "http",
      :base_url   => "imgix.net"
    }
  end
    
  def self.included(base)
    # add methods in ClassMethods into the meta class
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def has_imgix_attachment(name, options = {})
      include InstanceMethods
      
      class_attribute :options
      self.options = options
      
      if self.attachment_definitions.nil?
        self.attachment_definitions = {}
      else
        self.attachment_definitions = self.attachment_definitions.dup
      end
      
      self.attachment_definitions[name] = Imgix::AttachmentOptions.new(options)
      
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
    
    # def attachment_definitions
    #   self.attachment_definitions
    # end
  end
  
  module InstanceMethods
    def attachment_for(name)
      @_attachments ||= {}
      @_attachments[name] ||= Imgix::Attachment.new(name, self, self.class.options)
    end
  end
end

ActiveRecord::Base.send(:extend, Imgix::ClassMethods)
ActionView::Base.send(:include, Imgix::ViewHelpers)