require 'yaml'
require 'erb'

begin
  # Load the database.yml file
  yaml_content = ERB.new(File.read('config/database.yml')).result

  # Parse the YAML content
  parsed_yaml = YAML.safe_load(yaml_content, aliases: true)

  puts parsed_yaml
rescue Psych::SyntaxError => e
  puts "YAML Syntax Error: #{e.message}"
end

