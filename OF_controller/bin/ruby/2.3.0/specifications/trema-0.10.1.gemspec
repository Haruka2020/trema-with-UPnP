# -*- encoding: utf-8 -*-
# stub: trema 0.10.1 ruby lib

Gem::Specification.new do |s|
  s.name = "trema"
  s.version = "0.10.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Yasuhito Takamiya"]
  s.date = "2016-02-29"
  s.description = "Trema is a full-stack, easy-to-use framework for developing OpenFlow controllers in Ruby."
  s.email = ["yasuhito@gmail.com"]
  s.executables = ["trema"]
  s.files = ["bin/trema"]
  s.homepage = "http://github.com/trema/trema"
  s.licenses = ["GPL3"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Full-stack OpenFlow framework."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>, ["~> 1.11.2"])
      s.add_runtime_dependency(%q<gli>, ["~> 2.13.4"])
      s.add_runtime_dependency(%q<phut>, ["~> 0.7.7"])
      s.add_runtime_dependency(%q<pio>, ["~> 0.30.0"])
      s.add_development_dependency(%q<relish>, ["~> 0.7.1"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_development_dependency(%q<aruba>, ["~> 0.13.0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, ["~> 0.4.8"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.10"])
      s.add_development_dependency(%q<cucumber>, ["~> 2.3.2"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<reek>, ["~> 3.10.2"])
      s.add_development_dependency(%q<rspec>, ["~> 3.4.0"])
      s.add_development_dependency(%q<rspec-given>, ["~> 3.8.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.37.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.11.2"])
      s.add_dependency(%q<gli>, ["~> 2.13.4"])
      s.add_dependency(%q<phut>, ["~> 0.7.7"])
      s.add_dependency(%q<pio>, ["~> 0.30.0"])
      s.add_dependency(%q<relish>, ["~> 0.7.1"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_dependency(%q<aruba>, ["~> 0.13.0"])
      s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0.4.8"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.10"])
      s.add_dependency(%q<cucumber>, ["~> 2.3.2"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<reek>, ["~> 3.10.2"])
      s.add_dependency(%q<rspec>, ["~> 3.4.0"])
      s.add_dependency(%q<rspec-given>, ["~> 3.8.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.37.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.11.2"])
    s.add_dependency(%q<gli>, ["~> 2.13.4"])
    s.add_dependency(%q<phut>, ["~> 0.7.7"])
    s.add_dependency(%q<pio>, ["~> 0.30.0"])
    s.add_dependency(%q<relish>, ["~> 0.7.1"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
    s.add_dependency(%q<aruba>, ["~> 0.13.0"])
    s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0.4.8"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.10"])
    s.add_dependency(%q<cucumber>, ["~> 2.3.2"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<reek>, ["~> 3.10.2"])
    s.add_dependency(%q<rspec>, ["~> 3.4.0"])
    s.add_dependency(%q<rspec-given>, ["~> 3.8.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.37.2"])
  end
end
