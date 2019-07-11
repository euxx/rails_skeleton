require 'active_support/core_ext/string/inflections'
require 'tempfile'

def setup_app_name
  param = 'app_name='
  return unless ARGV.first&.start_with?(param)

  puts "== Set app name =="

  file_path = 'config/initializers/_app_name.rb'
  require_relative "../#{file_path}"
  current_name = APP_NAME
  new_name = ARGV.first.sub(param, '')

  edit(file_path) do |tempfile|
    tempfile << "APP_NAME = '#{new_name}'"
  end

  replace('config/application.rb', current_name.camelize, new_name.camelize)
  replace('config/database.yml', current_name.upcase, new_name.upcase)
  replace('config/environments/production.rb', current_name, new_name)
  replace('config/database.yml', current_name, new_name)
  replace('config/cable.yml', current_name, new_name)
  replace('package.json', current_name, new_name)

  system('git add .')
  system("git commit -m 'Set app name to #{new_name}'")
  puts
end

def replace(file, string, new_string)
  edit(file) do |tempfile|
    File.open(file).each do |line|
      tempfile << line.gsub(string, new_string)
    end
  end
end

def edit(file)
  Tempfile.open(".#{File.basename(file)}", File.dirname(file)) do |tempfile|
    yield tempfile
    FileUtils.mv tempfile.path, file
  end
end
