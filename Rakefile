require 'rake'
require 'erb'

BACKUP_DIR = File.join(ENV["HOME"], ".backup_dotfiles")
NON_DOTFILES = %w[Rakefile README.md LICENSE]

desc "install the dot files into user's home directory"
task :install => :backup do
  replace_all = false

  Dir['*'].each do |file|
    next if NON_DOTFILES.include? file

    dotfile = dotfile_path(file)
    short_dotfile = short_dotfile_path(file)
    
    if File.exist?(dotfile)
      if File.identical?(file, dotfile)
        puts "identical #{short_dotfile}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite #{short_dotfile}? [ynaq] "

        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping #{short_dotfile}"
        end
      end
    else
      link_file(file)
    end
  end

  setup_vundle

end

desc "backup the dot files to the '~/.backup_dotfiles' directory"
task :backup do 
  prepare_backups
  backup_all = false
  
  Dir['*'].each do |file|
    next if NON_DOTFILES.include? file

    dotfile = dotfile_path(file)
    short_dotfile = short_dotfile_path(file)
    backup = backup_file_path(file)
    
    if File.exist?(dotfile)
      if File.identical?(backup, dotfile)
        puts "already backed up #{short_dotfile}"
      elsif backup_all
        backup_file(file)
      else
        print "backup #{short_dotfile}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          backup_all = true
          backup_file(file)
        when 'y'
          backup_file(file)
        when 'q'
          exit
        else
          puts "skipping #{short_dotfile}"
        end
      end
    else
      puts "#{short_dotfile} doesn't exist to be backed up"
    end
  end
end

desc "restore the backed up dot files to the user's home directory"
task :restore do 
  restore_all = false

  if not File.exists?(BACKUP_DIR)
    puts "#{BACKUP_DIR} does not exist."
  else
    Dir["#{ENV['HOME']}/.backup_dotfiles/*"].each do |file|
      restore_file(file)
    end
  end
end

desc "uninstall the dot files and restore the originals"
task :uninstall do
  uninstall_all = false
  
  Dir['*'].each do |file|
    next if NON_DOTFILES.include? file

    dotfile = dotfile_path(file)
    short_dotfile = short_dotfile_path(file)
    
    if File.exist?(dotfile)
      if not File.symlink?(dotfile)
        puts "#{short_dotfile} is not a symlink, and can't be uninstalled"
      elsif uninstall_all
        unlink_file(dotfile)
      else
        print "unlink #{short_dotfile}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          uninstall_all = true
          unlink_file(dotfile)
        when 'y'
          unlink_file(dotfile)
        when 'q'
          exit
        else
          puts "skipping #{short_dotfile}"
        end
      end
    else
      puts "#{short_dotfile} doesn't exist, and can't be uninstalled"
    end
  end

  Rake::Task[':restore'].invoke
end

def setup_vundle
  system %Q{git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle}
  system %Q{vim +BundleInstall +helptags +qall}
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def prepare_backups
  system %Q{mkdir #{BACKUP_DIR}} unless File.exists?(BACKUP_DIR)
end

def backup_file(file)
  system %Q{cp -r #{dotfile_path(file)} #{BACKUP_DIR}}
  puts "backing up #{short_dotfile_path(file)}"
end

def backup_file_path(file)
  File.join(BACKUP_DIR, "#{file.sub('.erb', '')}")
end

def dotfile_path(file)
  File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
end

def short_dotfile_path(file)
  "~/.#{file.sub('.erb', '')}"
end

def restore_file(file)
  system %Q{cp -r #{BACKUP_DIR}/#{file} #{ENV["HOME"]}}
  puts "restoring #{short_dotfile_path(file)}"
end

def unlink_file(dotfile)
  File.unlink(dotfile)
  puts "unlinking #{dotfile}"
end
