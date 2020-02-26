$ ->
  app = App.cable.subscriptions.create({
    channel: 'ChatChannel'
    room_id: $('#room').data('room')
  },
    connected: (data) ->
    disconnected: (data) ->
    received: (data) ->
      if $('#room').data('user') == data['current_user_id']
        $('.message').append '<p style="text-align: right">' + data['data'] + '</p>'
      else
        $('.message').append '<p style="text-align: left">' + data['data'] + '</p>'
      return
  )
  $(document).on 'keypress', '.post', (e) ->
    if e.keyCode == 13
      app.perform 'speak',
        data: $('.post').val()
        current_user_id: $('#room').data('user')
      $('.post').val ''
    return
  return