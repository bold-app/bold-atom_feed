$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bold-atom_feed"
  s.version     = '0.1.0'
  s.authors     = ["Jens Kraemer"]
  s.email       = ["jk@jkraemer.net"]
  s.homepage    = 'http://github.com/bold-app/bold-atom_feed'
  s.summary     = "Atom feed plugin for Bold"
  s.description = "Atom feed plugin for Bold"
  s.license     = "AGPL"

  s.files = Dir["{app,config,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'draper', '~> 2.1'
  s.add_dependency 'liquid', '~> 3.0'

end
