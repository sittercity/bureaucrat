lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bureaucrat/version'

prerelease = ENV['SC_PRERELEASE'] == 'true'

Gem::Specification.new do |s|
  s.name        = 'bureaucrat-sc'
  s.version = if prerelease
                "#{Bureaucrat::VERSION}.pre#{Time.now.to_i}"
              else
                Bureaucrat::VERSION
              end
  s.summary     = "Form handling for Ruby inspired by Django forms."
  s.description = "Bureaucrat is a form handling library for Ruby."
  s.author      = "Bruno Deferrari"
  s.email       = "utizoc@gmail.com"
  s.homepage    = "http://github.com/tizoc/bureaucrat"
  s.files       = Dir[File.join('lib', '**', '*.rb')]
  s.files       += Dir[File.join('locales', '**', '*.yml')]
  s.metadata    = { "github_repo" => "ssh://github.com/sittercity/bureaucrat" }

  s.required_ruby_version = '>= 3.2'

  s.add_runtime_dependency 'i18n'
  s.add_runtime_dependency 'activesupport', '~> 8.1.3'

  s.add_development_dependency 'rake',  '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.13'

  s.require_paths = ['lib']
end
