# frozen_string_literal: true

require 'active_record'
require 'rails'
require 'active_support/core_ext/hash/keys'
require 'yaml'
require 'json'

module RailsJsonSeeder
  # Provides functionality to load seed data from JSON files for Rails applications.
  # This module encapsulates the logic to read configurations, parse JSON files,
  # and seed the database with the provided data.
  #
  # Example:
  #   Seeder.load_seeds('path_to/seed_config.yml')
  #
  class Seeder
    def load_seeds(config_path = 'db/seed_config.yml')
      config = load_config(config_path)
      process_seeds(config)
    end

    private

    def load_config(config_path)
      YAML.load_file(config_path).deep_symbolize_keys.tap do |config|
        config[:files] = config[:files].transform_keys(&:to_s).transform_values(&:symbolize_keys)
      end
    end

    def process_seeds(config)
      raise 'Rails.root is nil. This code must be executed in a Rails context.' if Rails.root.nil?

      seed_file_base_path = config[:seed_file_base_path] ? Rails.root.join(config[:seed_file_base_path]) : Rails.root
      config[:files].each do |file, item|
        puts "Processing: #{seed_file_base_path.join(file)}"
        process_file(seed_file_base_path.join(file), item)
      end
    end

    def process_file(path, item) # rubocop:disable Metrics/AbcSize
      klass = resolve_constant(item[:model])

      dependencies = item[:dependencies] || {}
      records = JSON.parse(File.read(path))

      ActiveRecord::Base.transaction do
        records.each do |record|
          resolve_dependencies(record, dependencies)
          klass.find_or_create_by!(record)
        end
      end

      puts "Finished: #{klass}"
    rescue Errno::ENOENT
      puts "Could not find file at #{path}"
    rescue JSON::ParserError
      puts "Could not parse JSON in file at #{path}"
    rescue StandardError => e
      puts "An error occurred at #{item}: #{e.message}"
      pp e.backtrace
    end

    def resolve_constant(class_name)
      model_name = class_name.constantize
      raise "Could not find class #{class_name}." unless Object.const_defined?(class_name)

      model_name
    rescue NameError
      raise "Could not find class #{class_name}. Please check your seed configuration."
    end

    def resolve_dependencies(record, dependencies)
      dependencies.each do |dependency|
        dependency_class = resolve_constant(dependency[:class])
        foreign_key = dependency[:id] || "#{dependency_class.name.underscore}_id"
        original_field_name = dependency[:alias] || dependency_class.name.underscore

        next unless record[original_field_name]

        dependent_record = dependency_class.find_by!(record[original_field_name])
        record[foreign_key] = dependent_record.id
        record.delete(original_field_name)
      end
    end
  end
end
