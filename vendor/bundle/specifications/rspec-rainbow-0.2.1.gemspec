# -*- encoding: utf-8 -*-
# stub: rspec-rainbow 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-rainbow".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mike Coutermarsh".freeze]
  s.date = "2016-06-18"
  s.description = "the rainbow progress formatter for RSpec".freeze
  s.email = ["coutermarsh.mike@gmail.com".freeze]
  s.homepage = "https://github.com/mscoutermarsh/rspec-rainbow".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "RSpec rainbow formatter".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>.freeze, ["< 4", ">= 2.14.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.35"])
    else
      s.add_dependency(%q<rspec>.freeze, ["< 4", ">= 2.14.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.35"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["< 4", ">= 2.14.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.35"])
  end
end
