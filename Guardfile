guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/(.+)\.rb$}) { |m| "spec/#{m[1]}.rb" }
end
