# dry codes
$form = $('#add-item-form')

$form[0].reset()
$form.find(".success").removeClass("success")
$form.find(".success-message").remove()
$form.submit()

# wet codes
$('#add-item-form')[0].reset()
$('#add-item-form').find(".success").removeClass("success")
$('#add-item-form').find(".success-message").remove()
$('#add-item-form').submit()
