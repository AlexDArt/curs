if ('<%= @hall.nil? %>' == 'true')
  $('#stack_hall_attributes_id').val('')
  $('#stack_hall_attributes_short_name').val('')
  $('#stack_hall_attributes_full_name').val('')
else
  $('#stack_hall_attributes_id').val('<%= @hall.try(:id) %>')
  $('#stack_hall_attributes_short_name').val('<%= @hall.try(:short_name) %>')
  $('#stack_hall_attributes_full_name').val('<%= @hall.try(:full_name) %>')
