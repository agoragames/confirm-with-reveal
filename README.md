# confirm-with-reveal

Replacement for window.confirm() using the Reveal modal popup plugin from ZURB Foundation.

For maximum **“are you really, really sure”** protection, the user can optionally be prompted to type out a word or phrase to enable the button to proceed.

Requires [jQuery](http://jquery.com/), as well as ZURB’s [Reveal](http://foundation.zurb.com/docs/components/reveal.html) plugin.

Integrates with the Rails [jQuery UJS adapter](https://github.com/indirect/jquery-rails) if the latter has been included, by overwriting `$.rails.confirm`. Simple use of `confirm: "Are you sure?"` in the `link_to` helper will use the standard `window.confirm()` prompt; see CoffeeScript source for full usage details.

For Rails < 6 use version 1.0.x that overwrites `$.rails.allowAction`.

## Example

See [the project page](http://agoragames.github.io/confirm-with-reveal/) for a demo.

## Basic usage

Run `$(document).confirmWithReveal()` after including this plugin to initialize it. This plugin must be included **after** jQuery (and if integrating with Rails, after the `jquery_ujs` plugin as well).

Then simply put a `data-confirm` attribute on whatever links or buttons you like (e.g. `<a href="…" data-confirm>…</a>`. You may put this attribute directly on a form element as well to confirm all submissions.

If the `data-confirm` attribute contains a plain string (e.g. `<a href="…" data-confirm="Are you sure?">…</a>`), the default `$.rails.confirm` or `window.confirm` function will perform the confirmation.

## Advanced usage

You may customize the plugin in two ways: in the initialization call (to apply to all instances of confirmation popups on the page) or directly in the individual link or button to be confirmed (for single-use configuration).

The initialization call accepts an options hash, with any or all of the following keys:

  - `modal_class`: CSS class(es) for the modal popup doing the confirmation
  - `title`: Text for title bar of modal popup (default: “Are you sure?”)
  - `title_class`: CSS class(es) for the title bar
  - `body`: Warning inside main content area of popup (default: “This action cannot be undone.”)
  - `body_class`: CSS class(es) for the main warning paragraph
  - `password`: If set, will require the user to type out this string to enable the action (default: none)
  - `prompt`: Format string for password prompt (`%s` will be replaced by the specified password; default: “Type <strong>%s</strong> to continue:”)
  - `footer_class`: CSS class(es) for the bottom area containing the buttons
  - `ok`: Label for the button that does the delete/destroy/etc. (default: “Confirm”)
  - `ok_class`: CSS class(es) for the button that does the delete/destroy/etc.
  - `cancel`: Label for the button that cancels out of the action (default: “Cancel”)
  - `cancel_class`: CSS class(es) for the button that cancels out of the action

Example:

```javascript
$(document).confirmWithReveal({
  ok: 'Make it so',
  cancel: 'Never mind'
})
```

You may also put a JSON-encoded object in the `data-confirm` attribute to customize a single confirmation popup. Rails’ `link_to` helper does the JSON conversion for you automatically; outside of Rails you may need to run `to_json` or the like explicitly.

Example:

```ruby
link_to(
  'Danger zone!',
  danger_zone_path,
  data: {
    confirm: {
      ok: 'Yup',
      cancel: 'Nope'
    }
  }
)
```

## Events

The plugin fires two events: `cancel.reveal` if a confirmable action is cancelled by the user, and `confirm.reveal` if the user wants to continue. The events are triggered on the link, button, or form containing the `data-confirm` attribute, and bubble up the DOM hierarchy (so they can be handled on `$(document)` if desired). At this time, additional confirmation or validation cannot be attached via these events. This is on the roadmap for a future version.
