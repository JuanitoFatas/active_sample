require "active_sample/version"
require "active_record"

module ActiveSample
  def sample
  end
end

ActiveRecord::Base.send :extend, ActiveSample
