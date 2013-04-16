# Expanded version of $.rails.allowAction from jquery_ujs.js
#
# Falls back to plain window.confirm() for links/buttons with just a simple 'confirm' key...
#   = link_to 'Delete', foo_path(foo), method: :delete, confirm: 'Are you sure?'
#
# Uses a nice Zurb Foundation modal window for links/buttons with HTML5 data set...
#   = link_to 'Delete', foo_path(foo), method: :delete, data: {
#       confirm: {
#         title: 'You might want to think twice about this!',
#         text: 'If you click "Simon Says Delete", there will be no takebacks!',
#         password: 'YESREALLY',
#         button: 'Simon Says Delete'
#       }
#     }
#
# Options:
#   title      Text for title bar of modal popup
#   text       Warning inside main content area of popup
#   password   If set, will require the user to type out this string to enable the action
#   button     Label for the button that does the delete/destroy/etc.

reveal_confirm = (element) ->

  confirm = element.data('confirm')
  return true unless confirm
  if typeof confirm == 'string'
    return window.confirm confirm

  modal = $ """
    <div class='reveal-modal medium'>
      <h2 class='header'></h2>
      <p class='warning'></p>
      <div class='footer'>
        <a class='cancel-button secondary button radius inline'>Cancel</a>
      </div>
    </div>
    """

  modal
    .find('.header')
    .html(confirm.title || 'Are you sure?')
  modal
    .find('.warning')
    .html(confirm.text || 'This action cannot be undone.')
  confirm_button = element
    .clone()
    .removeAttr('class')
    .removeAttr('data-confirm')
    .addClass('button radius alert inline confirm')
    .html(confirm.button || 'Confirm')
  modal
    .find('.cancel-button')
    .on 'click', (e) ->
      modal.foundation('reveal', 'close')
  modal
    .find('.footer')
    .append(confirm_button)

  if confirm.password
    confirm_html = """
      <label>Type <i>#{confirm.password}</i> to continue:</label>
      <input class='confirm-password' type='text' />
      """
    modal
      .find('.warning')
      .after($(confirm_html))
    modal
      .find('.confirm-password')
      .on 'keyup', (e) ->
        confirm_button.toggleClass 'disabled', $(this).val() != confirm.password
    confirm_button
      .addClass('disabled')
      .on 'click', (e) ->
        return false if $(this).hasClass('disabled')

  modal
    .appendTo($('body'))
    .foundation('reveal', 'open')
    .on 'closed.fndtn.reveal', (e) ->
      modal.remove()

  return false

if $.rails

  $.rails.allowAction = reveal_confirm

else

  $(document).on 'click', '[data-confirm]', (e) ->
    proceed = reveal_confirm $(this)
    if !proceed
      e.preventDefault()
      e.stopImmediatePropagation()
    proceed
