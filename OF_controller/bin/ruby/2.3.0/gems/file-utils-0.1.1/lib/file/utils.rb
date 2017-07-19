require 'fileutils'

class File #:nodoc:
  module Utils
    extend self
    
    # Creates a file. If you provide a block, the method
    # will yield the created file, opened for writing.
    #
    # === Without a block
    #
    #   File::Utils.create '/my/file/rb'
    #
    # === With a block
    #
    #   File::Utils.create '/my/file.rb' do |f|
    #     f.write "some code here" 
    #   end
    #
    # === Raises
    #   Errno::EEXIST:: if the file already exists
    def create(path, &block)
      if File.file?(path)
        raise Errno::EEXIST, path
      end
      
      FileUtils.mkdir_p(File.dirname(path))
      FileUtils.touch(path)
      
      if block_given?
        begin yield file = File.open(path, 'w')
        ensure file.close
        end
      end
    end
    
    # File::Utils.remove '/my/file.asp'
    # File::Utils.remove Dir['*.asp']
    def destroy(*paths)
      paths.each do |path|
        FileUtils.rm(path) if File.file?(path)        
      end
    end
    
    # Acts like <tt>remove</tt>, but doesn't check whether files exist
    # before attempting to remove them.
    #
    # === Raises
    #   Errno::ENOENT:: if a file you're trying to delete doesn't exist.
    def destroy!(*paths)
      paths.each do |path|
        FileUtils.rm(path)
      end
    end
    
    # Opens a file, overwrite its contents with the contents you provide,
    # then closes the file.
    def rewrite(path, contents)
      File.open(path, 'w') { |f| f.write(contents) }
    end    
  end
end