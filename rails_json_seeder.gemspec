# frozen_string_literal: true

require_relative "lib/rails_json_seeder/version"

Gem::Specification.new do |spec|
  spec.name = "rails_json_seeder"
  spec.version = RailsJsonSeeder::VERSION
  spec.authors = ["kenta.yamamoto"]
  spec.email = ["yamamoto7.pgming@gmail.com"]

  spec.summary = "A gem for easy seeding of Rails projects from JSON files."
  spec.description = "RailsJsonSeeder provides an intuitive way to seed Rails applications " \
                     "using JSON formatted seed files. With support for defining model dependencies, " \
                     "this gem makes seeding complex applications a breeze. Perfect for projects that " \
                     "want to keep their seeding process clean and maintainable."


  spec.homepage = "https://github.com/yamamoto7/rails_json_seeder"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yamamoto7/rails_json_seeder"
  spec.metadata["changelog_uri"] = "https://github.com/yamamoto7/rails_json_seeder/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
