$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "stimulus_reflex_globalid/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "stimulus_reflex_globalid"
  spec.version     = StimulusReflexGlobalid::VERSION
  spec.authors     = ["Joshua LeBlanc"]
  spec.email       = ["joshleblanc94@gmail.com"]
  spec.homepage    = "https://github.com/joshleblanc/stimulus_reflex_globalid"
  spec.summary     = "Map global IDs to models in reflexes"
  spec.description = "Map global IDs to models in reflexes"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", [">= 5.2", "< 7.0"]
  spec.add_dependency "stimulus_reflex"

  spec.add_development_dependency "sqlite3"
end
