(%w/gli trema/).map{|e|
	path = Gem::Specification.find_by_path(e).full_gem_path
	puts "#{e.ljust(10)} : #{path}"
}
