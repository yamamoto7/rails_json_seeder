# RailsJsonSeeder

RailsJsonSeeder is a gem to easily read JSON seed data for Rails applications and reflect it in the database.

## Installation

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
`seed_config`
```
seed_file_base_path: 'db/seed_json/' # default value is db/
files:
  'users.json':
    model: User
  'categories.json':
    model: Category
  'books.json':
    model: Book
    dependencies:
      - class: Category
  'user_books.json':
    model: UserBook
    dependencies:
      - class: User
      - class: Book
```

### Creating JSON files
`user_books.json`
```
[
  {
    "first_name": "John",
    "last_name": "Doe"
  },
  {
    "first_name": "Bob",
    "last_name": "Brown"
  }
]
```
`categories.json`
```
[
  {
    "label": "Science Fiction"
  },
  {
    "label": "History"
  }
]
```
`books.json`
```
[
  {
    "title": "The Time Traveler's Tale",
    "description": "An intriguing story of a man who discovers a machine that can transport him through time.",
    "category": {
      "label": "Science Fiction"
    }
  },
  {
    "title": "Stars Beyond Reach",
    "description": "Set in a distant future, a tale of interstellar exploration and the challenges faced by humanity in the vastness of space.",
    "category": {
      "label": "Science Fiction"
    }
  },
  {
    "title": "Rise and Fall of Empires",
    "description": "An exhaustive study of the world's greatest empires, their dominance, and eventual decline.",
    "category": {
      "label": "History"
    }
  }
]
```
`user_books.json`
```
[
  {
    "book": {
      "title": "The Time Traveler's Tale"
    },
    "user": {
      "first_name": "John",
      "last_name": "Doe"
    }
  },
  {
    "book": {
      "title": "Rise and Fall of Empires"
    },
    "user": {
      "first_name": "Bob",
      "last_name": "Brown"
    }
  }
]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yamamoto7/rails_json_seeder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/yamamoto7/rails_json_seeder/blob/main/CODE_OF_CONDUCT.md).

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsJsonSeeder project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_json_seeder/blob/main/CODE_OF_CONDUCT.md).
