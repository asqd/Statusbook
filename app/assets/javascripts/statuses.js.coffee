# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hover = -> 
    $('.status').hover (event) -> 
    	$(this).toggleClass("hover")
    	
$(document).ready(hover)    	
$(document).on('page:load', hover)

if $('#with-button').size() > 0
    $('.pagination').hide()
    loading_statuses = false

$('#load_more_statuses').show().click ->
      unless loading_statuses
        loading_statuses = true
        console.log(loading_statuses)
        more_statuses_url = $('.pagination .next_page a').attr('href')
        console.log(more_statuses_url)
        $this = $(this)
        $this.html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />').addClass('disabled')
        $.getScript more_statuses_url, ->
          $this.text('More statuses').removeClass('disabled') if $this
          loading_statuses = false
      return