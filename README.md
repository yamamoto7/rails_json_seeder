# RailsJsonSeeder

[![Gem Version](https://badge.fury.io/rb/rails_json_seeder.svg)](https://badge.fury.io/rb/rails_json_seeder) [![Open Source Helpers badge](https://codetriage.com/yamamoto7/rails_json_seeder/badges/users.svg)](https://codetriage.com/yamamoto7/rails_json_seeder)  
RailsJsonSeeder is a gem to easily read JSON seed data for Rails applications and reflect it in the database.

## Installation
https://rubygems.org/gems/rails_json_seeder

Install the gem and add to the application's Gemfile by executing:
```
$ gem install rails_json_seeder
```

## Quickstart
### Setup
First, call RailsJsonSeeder in the seed.rb file as follows:
```
RailsJsonSeeder.load_seeds('db/seed_config.yml')
```

### Creating a configuration file

A sample configuration file can be viewed [here](https://github.com/yamamoto7/rails_json_seeder/blob/main/test/dummy/db/seed_config_sample_1.yml).

### Creating JSON files

Sample json data can be viewed [here](https://github.com/yamamoto7/rails_json_seeder/tree/main/test/dummy/db/seed_json_sample_1).

## Contributions
🌱 Early Days of Our Project: We'd like to candidly express that RailsJsonSeeder is in its infancy. As with many open-source software (OSS) projects in their early stages, there may be areas that are not yet polished or might require further refinements.

🤝 Your Contribution Matters: Despite our project's budding phase, or perhaps because of it, every contribution holds significant value. Whether you're a veteran open-source contributor or a newcomer, your insights, feedback, and contributions can make a real difference.

### How Can You Help?
1. Identifying Bugs: If you notice any bugs or inconsistencies, please open an issue. Your detailed observations can help us rectify and improve.
2. Suggesting Enhancements: Have ideas on how we can do better? Propose enhancements or new features. We're all ears!
3. Code Contributions: Directly contribute to the codebase following the previously mentioned contribution steps. If you're uncertain about something, feel free to ask.
4. Documentation & Examples: Found a typo? Think a section of our documentation could be clearer? Your feedback can make our documentation more user-friendly.
5. Spreading the Word: The more people know about our project, the better. Share our project, write about it, or even give us a shoutout.

### An Invitation to All:
This is a space of collaboration, learning, and growth. We're committed to fostering a welcoming and inclusive environment for everyone. If you ever have questions, feedback, or suggestions, please don't hesitate to reach out.

Together, let's make RailsJsonSeeder a valuable tool for the Rails community!

### How to start development
#### clone repo
```
$ git clone git@github.com:yamamoto7/rails_json_seeder.git
$ cd rails_json_seeder
```

#### add or edit code
```
├─ lib/
   ├─ rails_json_seeder.rb # entry point
   └─ rails_json_seeder/
      └─ seeder.rb # core functions
```

#### try features
```
$ cd test/dummy/
$ rails db:seed
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

