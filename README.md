# confirm-with-reveal

Replacement for window.confirm() using the Reveal modal popup plugin from ZURB Foundation.

For maximum **“are you really, really sure”** protection, the user can optionally be prompted to type out a word or phrase to enable the button to proceed.

Requires [jQuery](http://jquery.com/), as well as ZURB’s [Reveal](http://foundation.zurb.com/docs/components/reveal.html) plugin.

Integrates with the Rails [jQuery UJS adapter](https://github.com/indirect/jquery-rails) if the latter has been included, by overwriting `$.rails.allowAction`. Simple use of `confirm: "Are you sure?"` in the `link_to` helper will use the standard `window.confirm()` prompt; see CoffeeScript source for full usage details.

## Example

See [this jsFiddle](http://jsfiddle.net/PtVNW/) for a demo.
