# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  
  #$('#pl_pay_with_card').hide()
  #$('#pl_mycards').hide()
  #$('#pl_billing_fields').hide()
  #$('#pl_paypal_checkout').attr("checked","checked")
  #$('#pl_paypal_checkout').show()#
  
  $('#pl_pay_with_paypal').click ->

      $('#pl_paypal_checkout').show()
      $('#pl_billing_fields').hide()
      true
    $('#pl_pay_with_card').click ->
      $('#pl_paypal_checkout').hide()
      $('#pl_billing_fields').show()
      true 

CreditCard =
  cleanNumber: (number) -> number.replace /[- ]/g, ""
  
  validNumber: (number) ->
    total = 0
    number = @cleanNumber(number)
    for i in [(number.length-1)..0]
      n = +number[i]
      if (i+number.length) % 2 == 0
        n = if n*2 > 9 then n*2 - 9 else n*2
      total += n
    total % 10 == 0

jQuery ->
  $("#credit_card_number").blur ->
    if CreditCard.validNumber(@value)
      $("#credit_card_number_error").text("")
    else
      $("#credit_card_number_error").text("Invalid credit card number.")