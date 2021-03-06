# -*- encoding: utf-8 -*-
# stub: pio 0.30.0 ruby lib

Gem::Specification.new do |s|
  s.name = "pio"
  s.version = "0.30.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Yasuhito Takamiya"]
  s.date = "2015-11-17"
  s.description = "Pure ruby packet parser and generator."
  s.email = ["yasuhito@gmail.com"]
  s.extra_rdoc_files = ["README.md", "CHANGELOG.md", "LICENSE", "CONTRIBUTING.md"]
  s.files = ["CHANGELOG.md", "CONTRIBUTING.md", "LICENSE", "README.md"]
  s.homepage = "http://github.com/trema/pio"
  s.licenses = ["GPL3"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Packet parser and generator."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bindata>, ["~> 2.1.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 4.2.4", "~> 4.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.10.6"])
      s.add_development_dependency(%q<pry>, ["~> 0.10.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<guard>, ["~> 2.13.0"])
      s.add_development_dependency(%q<guard-bundler>, ["~> 2.1.0"])
      s.add_development_dependency(%q<guard-cucumber>, ["~> 1.6.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 4.6.4"])
      s.add_development_dependency(%q<guard-rubocop>, ["~> 1.2.0"])
      s.add_development_dependency(%q<rb-fchange>, ["~> 0.0.6"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9.6"])
      s.add_development_dependency(%q<rb-inotify>, ["~> 0.9.5"])
      s.add_development_dependency(%q<terminal-notifier-guard>, ["~> 1.6.4"])
      s.add_development_dependency(%q<inch>, ["~> 0.7.0"])
      s.add_development_dependency(%q<relish>, ["~> 0.7.1"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, ["~> 0.4.8"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.3"])
      s.add_development_dependency(%q<cucumber>, ["~> 2.1.0"])
      s.add_development_dependency(%q<flay>, ["~> 2.6.1"])
      s.add_development_dependency(%q<flog>, ["~> 4.3.2"])
      s.add_development_dependency(%q<reek>, ["~> 3.6.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3.0"])
      s.add_development_dependency(%q<rspec-given>, ["~> 3.7.1"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.34.2"])
    else
      s.add_dependency(%q<bindata>, ["~> 2.1.0"])
      s.add_dependency(%q<activesupport>, [">= 4.2.4", "~> 4.2"])
      s.add_dependency(%q<bundler>, ["~> 1.10.6"])
      s.add_dependency(%q<pry>, ["~> 0.10.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<guard>, ["~> 2.13.0"])
      s.add_dependency(%q<guard-bundler>, ["~> 2.1.0"])
      s.add_dependency(%q<guard-cucumber>, ["~> 1.6.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 4.6.4"])
      s.add_dependency(%q<guard-rubocop>, ["~> 1.2.0"])
      s.add_dependency(%q<rb-fchange>, ["~> 0.0.6"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9.6"])
      s.add_dependency(%q<rb-inotify>, ["~> 0.9.5"])
      s.add_dependency(%q<terminal-notifier-guard>, ["~> 1.6.4"])
      s.add_dependency(%q<inch>, ["~> 0.7.0"])
      s.add_dependency(%q<relish>, ["~> 0.7.1"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0.4.8"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.3"])
      s.add_dependency(%q<cucumber>, ["~> 2.1.0"])
      s.add_dependency(%q<flay>, ["~> 2.6.1"])
      s.add_dependency(%q<flog>, ["~> 4.3.2"])
      s.add_dependency(%q<reek>, ["~> 3.6.0"])
      s.add_dependency(%q<rspec>, ["~> 3.3.0"])
      s.add_dependency(%q<rspec-given>, ["~> 3.7.1"])
      s.add_dependency(%q<rubocop>, ["~> 0.34.2"])
    end
  else
    s.add_dependency(%q<bindata>, ["~> 2.1.0"])
    s.add_dependency(%q<activesupport>, [">= 4.2.4", "~> 4.2"])
    s.add_dependency(%q<bundler>, ["~> 1.10.6"])
    s.add_dependency(%q<pry>, ["~> 0.10.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<guard>, ["~> 2.13.0"])
    s.add_dependency(%q<guard-bundler>, ["~> 2.1.0"])
    s.add_dependency(%q<guard-cucumber>, ["~> 1.6.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 4.6.4"])
    s.add_dependency(%q<guard-rubocop>, ["~> 1.2.0"])
    s.add_dependency(%q<rb-fchange>, ["~> 0.0.6"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9.6"])
    s.add_dependency(%q<rb-inotify>, ["~> 0.9.5"])
    s.add_dependency(%q<terminal-notifier-guard>, ["~> 1.6.4"])
    s.add_dependency(%q<inch>, ["~> 0.7.0"])
    s.add_dependency(%q<relish>, ["~> 0.7.1"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
    s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0.4.8"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.3"])
    s.add_dependency(%q<cucumber>, ["~> 2.1.0"])
    s.add_dependency(%q<flay>, ["~> 2.6.1"])
    s.add_dependency(%q<flog>, ["~> 4.3.2"])
    s.add_dependency(%q<reek>, ["~> 3.6.0"])
    s.add_dependency(%q<rspec>, ["~> 3.3.0"])
    s.add_dependency(%q<rspec-given>, ["~> 3.7.1"])
    s.add_dependency(%q<rubocop>, ["~> 0.34.2"])
  end
end
