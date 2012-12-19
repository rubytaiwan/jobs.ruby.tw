# -*- encoding : utf-8 -*-
puts "\n### Watching specs... ###\n"

def run_all_specs
  system("bundle exec rspec spec")
  puts
end
 
def run_spec(file)
  if File.exist?(file)
    puts "Running #{file}"
    system("bundle exec rspec #{file}")
    puts
  else
    puts "#{file} does not exist"
    return
  end
end

watch("^spec/.*/*_spec\.rb") do |match|
  run_spec match[0]
end

watch("^app/(.*/.*)\.rb") do |match|
  run_spec %{spec/#{match[1]}_spec.rb}
end

watch('^lib/(.*)\.rb') do |match| 
  run_spec %{spec/lib/#{match[1]}_spec.rb}
end

# Ctrl-\
Signal.trap('QUIT') do
 puts "\n### Running all specs ###\n"
 run_all_specs
end
       
# Ctrl-C
Signal.trap('INT') { abort("\n") }
