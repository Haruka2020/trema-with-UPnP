# -*- encoding: utf-8 -*-
# stub: file-utils 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "file-utils"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["jameswilding"]
  s.date = "2010-01-16"
  s.description = "file-utils makes using FileUtils easier"
  s.email = "james@jameswilding.net"
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://github.com/jameswilding/file-utils"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.5.1"
  s.summary = "A beautiful wrapper for FileUtils"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<redgreen>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<redgreen>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<redgreen>, [">= 0"])
  end
end
