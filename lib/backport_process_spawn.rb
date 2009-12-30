if RUBY_VERSION < '1.9.2'
 require 'win32/process'
 module Process
   def self.spawn command, args = {}
     options = {:app_name => command}
     startup_info = {}
     if args[:out]
       startup_info[:stdout] = File.open(args[:out], 'w') # it only accepts descriptors
     end
     options[:startup_info] = startup_info
     a = Process.create options
     a.process_id
     
   end
 end
 
 
end
