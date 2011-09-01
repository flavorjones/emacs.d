# -*- ruby -*-

require 'rubygems'
require 'rake'
require 'fileutils'

INSTALL_TARGETS = []
UPDATE_TARGETS = []

@target_dir = File.dirname __FILE__
@target_path = File.expand_path @target_dir

def add_task_to_update subdir, command, &block
  taskname = "update_#{subdir}".to_sym
  UPDATE_TARGETS << taskname
  desc "update #{subdir}"
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

def git_target name, giturl, &block
  dir_path = File.join(@target_path, name)
  INSTALL_TARGETS << dir_path
  desc "clone git repo #{name}"
  file dir_path do
    puts "* checking out latest #{name} from #{giturl} ..."
    puts %x(git clone #{giturl} #{name})
    block.call if block
  end
  add_task_to_git_update name, &block
end

def wget_target name, url, &block
  file_path = File.join(@target_path, name)
  INSTALL_TARGETS << file_path
  desc "wget #{name}"
  file file_path do
    FileUtils.mkdir_p File.dirname(file_path)
    puts "* pulling latest #{name} ..."
    puts %x(wget #{url} -O #{file_path})
    block.call if block
  end
end

def svn_target name, svnurl, &block
  dir_path = File.join(@target_path, name)
  INSTALL_TARGETS << dir_path
  desc "get svn report #{name}"
  file dir_path do
    puts "* checking out latest #{name} ..."
    puts %x(svn checkout #{svnurl} #{name})
    block.call if block
  end
  add_task_to_update name, "svn update", &block
end

# scala-mode
svn_target "scala-mode", "http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/emacs"

# ensime (scala)
git_target "ensime", "https://github.com/aemoncannon/ensime"

# ruby-mode
# svn_target "ruby-mode", "http://svn.ruby-lang.org/repos/ruby/trunk/misc"

# js2-mode
# svn_target "js2", "http://js2-mode.googlecode.com/svn/trunk" do
#   Dir.chdir "js2" do
#     puts "* compiling yegge's awesome j2 mode ..."
#     puts %x(make)
#     FileUtils.mv File.join(@target_path, "js2", "build", "js2.elc"), @js2_elc
#   end
# end

# INSTALL_TARGETS << @js2_elc = File.join(@target_path, "js2.elc")
# js2_el = File.join(@target_path, "js2", "build", "js2.el")

# file @js2_elc => js2_el
# file js2_el do
#   Rake::Task[:update_js2].invoke
# end


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
INSTALL_TARGETS << rinari_dir = File.join(@target_path, "rinari")

file rinari_dir do
  puts "* checking out rinari ..."
  puts %x(git clone https://github.com/flavorjones/rinari.git rinari)
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
git_target "rhtml", "https://github.com/eschulte/rhtml.git"

# yasnippets for rails
git_target "yasnippets-rails", "https://github.com/flavorjones/yasnippets-rails.git"

# cucumber
git_target "cucumber", "https://github.com/michaelklishin/cucumber.el.git"

# solarized color theme
git_target "solarized", "https://github.com/flavorjones/emacs-color-theme-solarized.git"

# generate ~/.emacs from template
dotemacs_target = File.join(@target_path, ".emacs")
INSTALL_TARGETS << dotemacs_target
UPDATE_TARGETS << dotemacs_target
dotemacs_symlink = File.join(ENV['HOME'], ".emacs")
dotemacs_template_source = File.join(@target_path, ".emacs.template")

file dotemacs_symlink => dotemacs_target do
  puts "* symlinking ~/.emacs ..."
  FileUtils.ln_sf dotemacs_target, dotemacs_symlink
end

file dotemacs_target => dotemacs_template_source do
  puts "* generating #{dotemacs_target} ..."
  File.open(dotemacs_target,"w") do |outfile|
    outfile.puts ";; this file was automatically generated by rake from #{@target_path}. do not overwrite."
    File.open(dotemacs_template_source) do |infile|
      infile.each_line do |line|
        outfile.puts line.gsub('~/.emacs.d', @target_path)
      end
    end
  end
end

desc "install ~/.emacs"
task :install => dotemacs_symlink

desc "remove ~/.emacs"
task :clean do
  if File.exists? dotemacs_symlink
    puts "deleting file #{dotemacs_symlink}"
    FileUtils.rm dotemacs_symlink 
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
task :external => INSTALL_TARGETS

desc "update external emacs packages"
task :update => UPDATE_TARGETS

desc "byte-compile .el files"
task :compile do
  # Dir["**/*.el"].each do |el|
  #   elc = el.gsub(/\.el$/, ".elc")
  #   if !File.exists?(elc) || (File.stat(elc).mtime < File.stat(el).mtime)      
  #     puts "compiling #{el} ..."
  #     Dir.chdir File.dirname(el) do
  #       `emacs -batch -q -f batch-byte-compile #{File.basename el}`
  #     end
  #   end
  # end
end

desc "install external packages, byte-compile local files, and install ~/.emacs"
task :default => [:external, :compile, :install]
