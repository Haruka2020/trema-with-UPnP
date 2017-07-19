# -*- encoding: utf-8 -*-
# stub: phut 0.7.7 ruby lib

Gem::Specification.new do |s|
  s.name = "phut"
  s.version = "0.7.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Yasuhito Takamiya"]
  s.date = "2016-02-12"
  s.description = "A simple network emulator with capabilities similar to mininet."
  s.email = ["yasuhito@gmail.com"]
  s.executables = ["phut", "vhost"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md", "bin/phut", "bin/vhost"]
  s.homepage = "http://github.com/trema/phut"
  s.licenses = ["GPL3"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Virtual network in seconds."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 4.2.5", "~> 4.2"])
      s.add_runtime_dependency(%q<gli>, ["~> 2.13.4"])
      s.add_runtime_dependency(%q<pio>, ["~> 0.30.0"])
      s.add_runtime_dependency(%q<pry>, ["~> 0.10.3"])
      s.add_development_dependency(%q<relish>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_development_dependency(%q<guard>, ["~> 2.13.0"])
      s.add_development_dependency(%q<guard-bundler>, ["~> 2.1.0"])
      s.add_development_dependency(%q<guard-cucumber>, ["~> 2.0.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 4.6.4"])
      s.add_development_dependency(%q<guard-rubocop>, ["~> 1.2.0"])
      s.add_development_dependency(%q<aruba>, ["~> 0.11.2"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.10"])
      s.add_development_dependency(%q<cucumber>, ["~> 2.1.0"])
      s.add_development_dependency(%q<flay>, ["~> 2.6.1"])
      s.add_development_dependency(%q<flog>, ["~> 4.3.2"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<reek>, ["~> 3.7.1"])
      s.add_development_dependency(%q<rspec>, ["~> 3.4.0"])
      s.add_development_dependency(%q<rspec-given>, ["~> 3.7.1"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.35.1"])
    else
      s.add_dependency(%q<activesupport>, [">= 4.2.5", "~> 4.2"])
      s.add_dependency(%q<gli>, ["~> 2.13.4"])
      s.add_dependency(%q<pio>, ["~> 0.30.0"])
      s.add_dependency(%q<pry>, ["~> 0.10.3"])
      s.add_dependency(%q<relish>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_dependency(%q<guard>, ["~> 2.13.0"])
      s.add_dependency(%q<guard-bundler>, ["~> 2.1.0"])
      s.add_dependency(%q<guard-cucumber>, ["~> 2.0.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 4.6.4"])
      s.add_dependency(%q<guard-rubocop>, ["~> 1.2.0"])
      s.add_dependency(%q<aruba>, ["~> 0.11.2"])
      s.add_dependency(%q<codeclimate-test-reporter>, [">= 0"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.10"])
      s.add_dependency(%q<cucumber>, ["~> 2.1.0"])
      s.add_dependency(%q<flay>, ["~> 2.6.1"])
      s.add_dependency(%q<flog>, ["~> 4.3.2"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<reek>, ["~> 3.7.1"])
      s.add_dependency(%q<rspec>, ["~> 3.4.0"])
      s.add_dependency(%q<rspec-given>, ["~> 3.7.1"])
      s.add_dependency(%q<rubocop>, ["~> 0.35.1"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 4.2.5", "~> 4.2"])
    s.add_dependency(%q<gli>, ["~> 2.13.4"])
    s.add_dependency(%q<pio>, ["~> 0.30.0"])
    s.add_dependency(%q<pry>, ["~> 0.10.3"])
    s.add_dependency(%q<relish>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
    s.add_dependency(%q<guard>, ["~> 2.13.0"])
    s.add_dependency(%q<guard-bundler>, ["~> 2.1.0"])
    s.add_dependency(%q<guard-cucumber>, ["~> 2.0.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 4.6.4"])
    s.add_dependency(%q<guard-rubocop>, ["~> 1.2.0"])
    s.add_dependency(%q<aruba>, ["~> 0.11.2"])
    s.add_dependency(%q<codeclimate-test-reporter>, [">= 0"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.10"])
    s.add_dependency(%q<cucumber>, ["~> 2.1.0"])
    s.add_dependency(%q<flay>, ["~> 2.6.1"])
    s.add_dependency(%q<flog>, ["~> 4.3.2"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<reek>, ["~> 3.7.1"])
    s.add_dependency(%q<rspec>, ["~> 3.4.0"])
    s.add_dependency(%q<rspec-given>, ["~> 3.7.1"])
    s.add_dependency(%q<rubocop>, ["~> 0.35.1"])
  end
end
