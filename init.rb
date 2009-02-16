require "skip_stamp"

ActiveRecord::Base.class_eval do
  include SkipStamp
end