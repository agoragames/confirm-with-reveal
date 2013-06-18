# confirm-with-reveal

Replacement for window.confirm() using the Reveal modal popup plugin from ZURB Foundation.

For maximum **“are you really, really sure”** protection, the user can optionally be prompted to type out a word or phrase to enable the button to proceed.

Requires [jQuery](http://jquery.com/), as well as ZURB’s [Reveal](http://foundation.zurb.com/docs/components/reveal.html) plugin.

Integrates with the Rails [jQuery UJS adapter](https://github.com/indirect/jquery-rails) if the latter has been included, by overwriting `$.rails.allowAction`. Simple use of `confirm: "Are you sure?"` in the `link_to` helper will use the standard `window.confirm()` prompt; see CoffeeScript source for full usage details.

## Example

See [the project page](http://agoragames.github.io/confirm-with-reveal/) for a demo.

## Basic usage

Set the `data-confirm` attribute to `1` on whatever links or buttons you like. You may put this attribute directly on a form element as well to confirm all submissions.

## Advanced usage

Put a JavaScript hash in the `data-confirm` attribute, using one or more of the keys below.

## Localization

You may globally customize the prompts etc. in the UI via `window.confirm_localization`. Available strings:

  - **`ok`**: Text of button for carrying out the protected action. Default value: `Confirm`
  - **`cancel`**: Text of button for backing out from the protected action. Default value: `Cancel`
  - **`title`**: Heading in warning popup. Default value: `Are you sure?`
  - **`body`**: Main contents of warning popup. Default value: `This action cannot be undone.`
  - **`password`**: Password to be typed to permit the action to be carried out. Default value: **false**
  - **`prompt`**: Text instructing user to type out the confirmation password. Default value: `Type <i>%s</i> to continue:` (`%s` will be replaced with the relevant password)
