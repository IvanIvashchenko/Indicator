$(document).ready ->
    $('.btn-buy-bundle').click ->
        url = '/products/' + $(@).data('bundle-id') + '/buy'
        $.ajax url,
            type: 'GET'
            dataType: 'json'
            error: (jqXHR, textStatus, errorThrown) ->
                $('body').append "AJAX Error: #{textStatus}"
            success: (data, textStatus, jqXHR) ->
                if data.error
                  alert data.error
                else
                  alert "Successful purchase"