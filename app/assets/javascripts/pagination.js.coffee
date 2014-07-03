loadStatuses = ->

  if $('#with-button').size() > 0
      $('.pagination').hide()
      loading_statuses = false

  $('#load_more_statuses').show().click ->
        unless loading_statuses
          loading_statuses = true
          more_statuses_url = $('.pagination .next_page').attr('href')
          console.log(more_statuses_url)
          $this = $(this)
          $.getScript more_statuses_url, ->
            $this.text('More statuses').removeClass('disabled') if $this
            loading_statuses = false
        return

$(document).ready(loadStatuses)      
$(document).on('page:load', loadStatuses)