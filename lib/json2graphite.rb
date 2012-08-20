
module Json2Graphite
  module_function

  def walk_the_forrest (obj=self, path=[], &blk)
    obj.each do |key,value|
      case value
      when Hash
        walk_the_forrest(value, [*path, key], &blk)
      else
        blk.call("#{[*path, key].join('.')}",value)
      end
    end
  end

  # Converts a hash of hashes into dot notaion used by graphite targets and
  # outputs to STDOUT.  Takes optional time argument, defaulting to now.

  def to_graphite (hash, time=Time.now.to_i)
    walk_the_forrest(hash) {|target, value|
      puts "#{target} #{value} #{time}"
    }
  end

  # Return an array of hashes, each hash a single graphite target, value, and time
  def get_graphite (hash, time=Time.now.to_i)
    data = []
    walk_the_forrest(hash) {|target, value|
      data << { :target => target, :value => value, :time => time }
      #data << "#{target} #{value} #{time}"
    }
    data
  end

end
