module SkipStamp

  def self.included(base)
    base.class_eval do
      def record_timestamps
        ActiveRecord::Base.record_timestamps && self.class.record_timestamps && @skip_stamp.blank?
      end

      def skip_stamp 
        @skip_stamp = true
        yield
        @skip_stamp = false
      end
    end
  end

end