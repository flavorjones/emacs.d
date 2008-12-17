# -*- ruby -*-

require 'rubygems'
require 'rake'
require 'fileutils'

INSTALL_TARGETS = []
UPDATE_TARGETS = []

target_dir = File.dirname __FILE__
target_path = File.expand_path target_dir

def add_task_to_update subdir, command, &block
  taskname = "update_#{subdir}".to_sym
  UPDATE_TARGETS << taskname
  task taskname do
    puts "* updating #{subdir} ..."
    Dir.chdir subdir do
      %x(#{command})
    end
    block.call if block
  end
end

def add_task_to_git_update subdir, &block
  add_task_to_update subdir, "git pull origin", &block
end

def add_task_to_svn_update subdir, &block
  add_task_to_update subdir, "svn update", &block
end

# ruby-mode
INSTALL_TARGETS << ruby_dir = File.join(target_path, "ruby-mode")

file ruby_dir do
  puts "* checking out latest ruby-mode ..."
  puts %x(svn checkout http://svn.ruby-lang.org/repos/ruby/trunk/misc ruby-mode)
end
add_task_to_svn_update "ruby-mode"


# js2-mode
INSTALL_TARGETS << js2_dir = File.join(target_path, "js2")
INSTALL_TARGETS << js2_elc = File.join(target_path, "js2.elc")
js2_el = File.join(target_path, "js2", "build", "js2.el")

file js2_dir do
  puts "* checking out yegge's awesome js2 mode ..."
  puts %x(svn checkout http://js2-mode.googlecode.com/svn/trunk/ js2)
end
file js2_elc => js2_el
file js2_el do
  Rake::Task[:update_js2].invoke
end
add_task_to_svn_update "js2" do
  Dir.chdir "js2" do
    puts "* compiling yegge's awesome j2 mode ..."
    puts %x(make)
    FileUtils.mv File.join(target_path, "js2", "build", "js2.elc"), js2_elc
  end
end


# exuberant ctags
INSTALL_TARGETS << :ctags

task :ctags do
  path_to_ctags = %x(which ctags)
  if path_to_ctags.empty?
    puts "* installing ctags ..."
    if ! %x(which apt-get).empty?
      puts %x(sudo apt-get install exuberant-ctags)
    elsif ! %x(which port).empty?
      puts %x(sudo port install ctags)
    else
      puts "WARNING: could not install ctags!"
    end
  end
end


# rinari
INSTALL_TARGETS << rinari_dir = File.join(target_path, "rinari")

file rinari_dir do
  puts "* checking out rinari ..."
  puts %x(git clone git://github.com/mdalessio/rinari.git rinari)
  Rake::Task[:update_rinari_submodules].invoke
end
task :update_rinari_submodules do
  puts "* updating rinari submodules ..."
  Dir.chdir("rinari") do
    puts %x(git submodule init)
    puts %x(git submodule update)
  end
end
add_task_to_git_update "rinari" do
  Rake::Task[:update_rinari_submodules].invoke
end

# rhtml-mode
INSTALL_TARGETS << rhtml_dir = File.join(target_path, "rhtml")

file rhtml_dir do
  puts "* checking out rhtml ..."
  puts %x(git clone git://github.com/eschulte/rhtml.git rhtml)
end
add_task_to_git_update "rhtml"

# yasnippets for rails
INSTALL_TARGETS << yas_dir = File.join(target_path, "yasnippets-rails")

file yas_dir do
  puts "* checking out yasnippets ..."
  puts %x(git clone git://github.com/mdalessio/yasnippets-rails.git yasnippets-rails)
end
add_task_to_git_update "yasnippets-rails"


# generate ~/.emacs from template
INSTALL_TARGETS << symlink_name = File.join(ENV['HOME'], ".emacs")
symlink_target = File.join(target_path, ".emacs")

file symlink_name => symlink_target do
  puts "* generating ~/.emacs ..."
  File.open(symlink_name,"w") do |outfile|
    outfile.puts ";; this file was automatically generated by rake from #{target_path}. do not overwrite."
    File.open(symlink_target) do |infile|
      infile.each_line do |line|
        outfile.puts line.gsub('~/.emacs.d', target_path)
      end
    end
  end
end


desc "remove ~/.emacs"
task :clean do
  if File.exists? symlink_name
    puts "deleting file #{symlink_name}"
    FileUtils.rm symlink_name 
  end    
end

desc "remove all external package files"
task 'clean:all' do
  targets = INSTALL_TARGETS.select {|f| f.is_a?(String) && File.exists?(f) }
  files = targets.select {|f| ! File.directory?(f)}
  dirs = targets.select {|f| File.directory?(f)}
  puts "deleting files #{files.join(', ')}"
  FileUtils.rm files
  puts "deleting directories #{dirs.join(', ')}"
  FileUtils.rm_rf dirs
end

desc "install external emacs packages"
task :default => INSTALL_TARGETS

desc "update external emacs packages"
task :update => UPDATE_TARGETS
