# RailsJsonSeeder

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

