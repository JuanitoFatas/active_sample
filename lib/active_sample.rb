require "active_sample/version"
require "active_record"

module ActiveSample
  class NegativeSampleError < ArgumentError
  end

  def sample(n = 1)
    if n < 0
      raise NegativeSampleError.new("negative sample number".freeze)
    end

    max_id = maximum(primary_key)

    return nil if max_id == nil

    if n == 1
      while !(found = find_by(primary_key => 1 + rand(max_id))); end

      found
    elsif n == 0
      none
    else
      where(primary_key => ids.sample(n))
    end
  end
end

ActiveRecord::Base.send :extend, ActiveSample
