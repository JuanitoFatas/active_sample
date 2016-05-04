require "active_sample/version"
require "active_record"

module ActiveSample
  def sample(n = 1)
    if count == 0
      nil
    else
      if n > count
        where(id: ids.shuffle)
      elsif n > 1
        where(id: ids.sample(n))
      else
        find ids.sample
      end
    end
  end
end

ActiveRecord::Base.send :extend, ActiveSample
