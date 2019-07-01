require 'tempfile'

def setup_app_name
  param = 'app_name='
  return unless ARGV.first&.start_with?(param)

  puts "\n== Set app name =="

  file_path = 'config/initializers/_app_name.rb'
  require_relative "../#{file_path}"
  current_name = APP_NAME
  new_name = ARGV.first.sub(param, '')

  Tempfile.open(".#{File.basename(file_path)}", File.dirname(file_path)) do |tempfile|
    tempfile << "APP_NAME = '#{new_name}'"
    FileUtils.mv tempfile.path, file_path
  end

  replace('config/application.rb', camelize(current_name), camelize(new_name))
  replace('package.json', current_name, new_name)

  puts "\nThe new app name is #{new_name}"
end

def replace(file, string, new_string)
  Tempfile.open(".#{File.basename(file)}", File.dirname(file)) do |tempfile|
    File.open(file).each do |line|
      tempfile.puts line.gsub(string, new_string)
    end
    FileUtils.mv tempfile.path, file
  end
end

def camelize(string)
  string.split('_').map(&:capitalize).join
end
