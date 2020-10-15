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

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
