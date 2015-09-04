# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  maxCount = 200
  $("#post_shortContent").keyup ->
    textCount = this.value.length
    displayCount = maxCount-textCount
    asd = $(this).next().find('span').text(displayCount)
    if displayCount<0 
        this.value = this.value.substr(0, maxCount);


$(document).ready(ready)
$(document).on('page:load', ready)
        

