module Json2Graphite
  module_function

  # Converts a hash of hashes into dot notaion used by graphite targets. Takes
  # optional time argument, defaulting to now.

  def dump(hash, time = Time.now.to_i)
    data = []
    raise "Hash was not received" unless hash.is_a? Hash
    walk_the_forrest(hash) do |target, value|
      data << "#{target} #{value} #{time}"
    end
    data
  end

  def dump_as_hash(hash, time = Time.now.to_i)
    data = []
    raise "Hash was not received" unless hash.is_a? Hash
    walk_the_forrest(hash) do |target, value|
      data << { :target => target, :value => value, :time => time }
    end
    data
  end

  # For backward compatibility with other things
  instance_eval { alias :to_graphite :dump }
  instance_eval { alias :get_graphite :dump_as_hash }

  # DOCUMENT THIS!!!
  def walk_the_forrest (obj=self, path=[], &blk)
    obj.each do |key,value|
      case value
      when Hash
        walk_the_forrest(value, [key, *path].reverse, &blk)
      else
        blk.call("#{path.join('.')}.#{key}",value)
      end
    end
  end
end

class Hash

  def to_graphite
    Json2Graphite.dump(self)
  end
end
