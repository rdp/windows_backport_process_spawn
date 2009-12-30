require 'spec/autorun'
require 'sane'
require_rel '../lib/backport_process_spawn'
require 'fileutils'

describe "process spawn" do

  it "should give me a pid" do
    a = Process.spawn 'cmd /c "echo 3"'
    a.should be_a Fixnum
  end
  
  it "should allow for out" do
    FileUtils.rm 'out' if File.exist?('out')    
    Process.spawn 'ls', :out => 'out'
    sleep 0.05
    assert File.exist?('out')
  end

end