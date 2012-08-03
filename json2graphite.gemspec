Gem::Specification.new do |gem|

  gem.name    = 'json2graphite'
  gem.version = '0.0.1'
  gem.date    = Date.today.to_s

  gem.summary     = "Convert json hash tree to graphite format"
  gem.description = "Useful for scripts not to know about graphite format"

  gem.author   = 'Zach Leslie'
  gem.email    = 'xaque208@gmail.com'
  gem.homepage = 'https://github.com/xaque208/json2graphite'

  # ensure the gem is built out of versioned files
   gem.files = Dir['Rakefile', '{bin,lib}/**/*', 'README*', 'LICENSE*'] & %x(git ls-files -z).split("\0")

   gem.executables << 'json2graphite'

   gem.add_dependency('json')

end


