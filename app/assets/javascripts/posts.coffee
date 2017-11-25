# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $('.post-item').on 'click', (e) ->
    postId = $(e.currentTarget).data('id')
    target = $(e.target)
    if target.hasClass('post-item')
      window.location.href = "/posts/#{postId}"
