module Imgix
  module InstanceMethods
    def attachment_for(name)
      @_attachments ||= {}
      @_attachments[name] ||= Imgix::Attachment.new(name, self, self.class.options)
    end
  end
end