# file-utils

	gem install file-utils

A better-looking wrapper for some common uses of FileUtils.

## Usage

	require 'file/utils'
	
	# Create a file
	File::Utils.create 	'/some/file.rb'	
	
	# Create a file and write to it
	File::Utils.create 	'/some/other/file.rb' do |f|
		f.write "Hello world!"
	end
	
	# Replace the contents of a file
	File::Utils.rewrite '/some/other/file.rb', 'New contents'	
	
	# Delete some files
	File::Utils.destroy ['/some/file.rb', '/some/other/file.rb']
	
See the docs in <tt>lib/file/utils.rb</tt> for more usage examples.

## Contributing

I wrote this to wrap some common FileUtils patterns I found myself using over and over. If there are patterns that you use repeatedly (and which involve FileUtils methods), please suggest an addition :)

## To Do

Tests! 

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Keep it simple.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 James Wilding. See LICENSE for details.
