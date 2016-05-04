require "active_sample/version"
require "active_record"

module ActiveSample
  class NegativeSampleError < ArgumentError
  end

  def sample(n = 1)
    if n < 0
      raise NegativeSampleError.new("negative sample number".freeze)
    end

    return nil if count == 0

    if n > count
      where(id: ids.shuffle)
    elsif n > 1
      where(id: ids.sample(n))
    elsif n == 0
      where(id: [])
    else
      find ids.sample
    end
  end
end

ActiveRecord::Base.send :extend, ActiveSample
