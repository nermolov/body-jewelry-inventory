# body-jewelry inventory

A body jewelry inventory app built for my boyfriend in the industry.

## Development

```sh
bundle install
bin/rails db:migrate
bin/dev
```

## Testing

```sh
bin/rails test:all
```

## Production

Authentication is needed before the app can be deployed to production

## Roadmap

- Configurable gauge or mm unit inputs for gauge/length/diameter fields
- Filter/Search/Sort index table
- Inline search select/creation for simple related models (e.g. Material)
- Add validation to more fields
- Write more tests
