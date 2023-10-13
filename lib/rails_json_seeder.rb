# frozen_string_literal: true

require_relative 'rails_json_seeder/version'
require_relative 'rails_json_seeder/seeder'

# Main module for RailsJsonSeeder
module RailsJsonSeeder
  class Error < StandardError; end

  class << self
    def load_seeds(config_path)
      puts 'Loading seeds by RailsJsonSeeder...'
      Seeder.new.load_seeds(config_path)
    end
  end
end
