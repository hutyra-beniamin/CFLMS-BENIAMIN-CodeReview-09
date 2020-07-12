/*Query shows Postoffice addresses*/
select post_office.post_office_address from post_office;
/*Query shows how many elements were send from a specific address*/
/*Case 1 the address is: postoffice 1*/
select count(post_office_address) from `post_office` where post_office.post_office_address = "postoffice 1";
/* Case 2  the address is: pickup 2*/
select count(pick_up_address) from `pick_up` where pick_up.pick_up_address = "pickupstreet 2";
/*Query shows when,who and which element send was send*/
select sender.fist_name , sender.last_name , sender.element , post_office.ORDER_date from `sender` join `post_office` on sender.sender_id = post_office.fk_sender_id;
/*Query shows when,where,who and which  element was send */
select sender.fist_name , sender.last_name , sender.element , pick_up.pick_up_date,pick_up.pick_up_address from `sender` join `pick_up` on sender.sender_id = pick_up.fk_sender_id;
/*Query show what element and by whom was send between 1.06.2020 and 1.08.2020*/
select sender.fist_name,sender.last_name, sender.sender_address, sender.element, post_office.ORDER_date from `sender` join `post_office` on sender.sender_id = post_office.fk_sender_id where post_office.ORDER_date BETWEEN "2020-06-01" and "2020-08-01";
/*Query shows who, what element sended and the dates of delivering process*/
select sender.fist_name, sender.last_name, sender.element, transport.start_delivery_date,recipient_post_office.date_receiving_element,recipient.date_receving_element_by_recipient from `sender` join `post_office` on sender.sender_id = post_office.fk_sender_id join `warehouse` on post_office.post_office_id = warehouse.fk_post_office_id join `transport` on warehouse.warehouse_id = transport.fk_warehouse_id join `recipient_post_office` on transport.transport_id = recipient_post_office.fk_transport_id join `recipient` on recipient_post_office.recipient_post_office_id = recipient.fk_recipient_post_office_id;
/*Query how many packages are send between 1.07.2020 and 25.07.2020*/
select count(transport_id) from `transport` where transport.start_delivery_date between "2020-07-01" and "2020-07-25";
/*Query show how many elements will be delivered between 1.07.2020 and 25.09.2020*/
select count(date_receving_element_by_recipient) from `recipient` where recipient.date_receving_element_by_recipient between "2020-07-01" and "2020-09-25";