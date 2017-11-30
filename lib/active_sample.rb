require "active_sample/version"
require "active_record"

module ActiveSample
  class NegativeSampleError < ArgumentError
  end

  def sample(n = 1)
    if n < 0
      raise NegativeSampleError.new("negative sample number".freeze)
    end

    return none if n == 0

    max_id = maximum(primary_key)

    return nil if max_id == nil

    if n == 1
      sample_one(max_id)
    else
      samples(n, max_id)
    end
  end

  def sample_one(max_id)
    found = nil
    while !found; found = random_record(max_id); end
    found
  end

  def random_record(max_id)
    find_by(primary_key => 1 + rand(max_id))
  end

  def samples(n, max_id)
    n.times.map { sample_one(max_id) }
  end
end

ActiveRecord::Base.send :extend, ActiveSample
