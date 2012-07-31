

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

  # Output graphite formatted data to STDOUT
  def to_graphite (hash, now=Time.now.to_i)
    walk_the_forrest(hash) {|target, value|
      puts "#{target} #{value} #{now}"
    }
  end

  # Return an array, each line a formatted graphite target
  def get_graphite (hash, now=Time.now.to_i)
    data = []
    walk_the_forrest(hash) {|target, value|
      data << "#{target} #{value} #{now}"
    }
    data
  end

end
