require "active_sample/version"
require "active_record"

module ActiveSample
  def sample
    if count == 0
      nil
    else
      find ids.sample
    end
  end
end

ActiveRecord::Base.send :extend, ActiveSample
