# StimulusReflexGlobalid

StimulusReflexGlobalId maps global IDs to instance variables during a reflex.

## Installation
`bundle add stimulus_reflex_globalid`

## Usage

No setup is required to use this library. 

In your markup, specific data-reflex and data attributes as normal

```erb
<button data-reflex="click->MyReflex#handle_click" data-foo="<%= @foo.to_global_id %>"
```

When the button is clicked, an instance variable `@foo` will be created, set to `@foo`.

```rb
class MyReflex < ApplicationReflex
  def handle_click
    p @foo
  end
end
```

You can also use signed IDs.

## Configuring

You can turn off signed/unsigned IDs by configuring the gem.

```ruby
StimulusReflexGlobalid::Engine.configure do |config|
  config.allow_signed = false # default true
  config.allow_unsigned = false # default true
end
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
