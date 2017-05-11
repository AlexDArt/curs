@delete_one_aut = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
@del_all_auts = ->
  $('a.remove_author').on 'click', ->
    window.delete_one_aut($(this))
    false
  false
@add_new_aut = ->
  $('#add_author_link').on 'click', ->
    newid = new Date().getTime()
    reg = new RegExp("new_author", "g")
    cont = $(this).attr('data-content')
    cont = cont.replace(reg, newid)
    $(this).parent().parent().after(cont)
    pan = $(this).parent().parent().parent().find('.panel-info').first()
    pan.find('a.remove_author').on 'click', ->
      window.delete_one_aut($(this))
    false
  false
aut_ready = ->
  window.add_new_aut()
  window.del_all_auts()
$(document).on 'page:load', aut_ready
$(document).ready aut_ready 
