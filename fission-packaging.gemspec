$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'fission-packaging/version'
Gem::Specification.new do |s|
  s.name = 'fission-packaging'
  s.version = Fission::Packaging::VERSION.version
  s.summary = 'Fission Packaging'
  s.author = 'Heavywater'
  s.email = 'fission@hw-ops.com'
  s.homepage = 'http://github.com/heavywater/fission-packaging'
  s.description = 'Fission Packaging'
  s.require_path = 'lib'
  s.add_dependency 'gli'
  s.add_dependency 'fog'
  s.add_dependency 'warbler'
  s.add_dependency 'rubyzip'
  s.executables << 'make-package'
  s.executables << 'upload-package'
  s.files = Dir['**/*']
end
