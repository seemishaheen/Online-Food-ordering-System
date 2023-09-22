menu_of_list = [
    {"id": 1, "name": "1. Sweet and Sour Spare Ribs", "price": 34, "$": "yuan"},
    {"id": 2, "name": "2. Sweet and Sour Fish", "price": 23, "$": "yuan"},
    {"id": 3, "name": "3. Big Chicken", "price": 65, "$": "yuan"},
    {"id": 4, "name": "4. Braised Pork", "price": 66, "$": "yuan"},
    {"id": 5, "name": "5. Pork dumplings", "price": 21, "$": "yuan"},
    {"id": 6, "name": "6. Beef Stroganoff", "price": 30, "$": "yuan"},
    {"id": 7, "name": "7. REUBEN ", "price": 20, "$": "yuan"},
    {"id": 8, "name": "8. SANDWITCH ", "price": 21, "$": "yuan"},
    {"id": 9, "name": "9. CHICKEN ", "price": 60, "$": "yuan"},
    {"id": 10, "name": "10. CAESAR SALAD", "price": 30, "$": "yuan"},
    {"id": 11, "name": "11. EGGS BENEDICT", "price": 40, "$": "yuan"},
    {"id": 12, "name": "12. CALIFORNIA ROLL", "price": 21, "$": "yuan"},
    {"id": 13, "name": "13. BLOODY MARY", "price": 40, "$": "yuan"},
    {"id": 14, "name": "14. POUND CAKE", "price": 60, "$": "yuan"},
    {"id": 15, "name": "15. NACHOS", "price": 50, "$": "yuan"},
    {"id": 16, "name": "16. PIZZA", "price": 71, "$": "yuan"},
    {"id": 17, "name": "17. BEEF WILLINGTON", "price": 21, "$": "yuan"},
    {"id": 18, "name": "18. DOUGHNUTS", "price": 60, "$": "yuan"},
    {"id": 19, "name": "19. GUMBO", "price": 40, "$": "yuan"},
    {"id": 20, "name": "20. BUFFALO WINGS", "price": 50, "$": "yuan"},
    {"id": 21, "name": "21. BANANAS FOSTER", "price": 70, "$": "yuan"},
    {"id": 22, "name": "22. HAMBURGER", "price": 60, "$": "yuan"},
]
Order_list = []
print(' Welcome to Malik Restaurant, ')
print("Today's menu: ")
for menu in menu_of_list:
    print(menu.get('name'), menu.get('price'), menu.get('$'))
while True:
    print('=' * 50)
    print("1. User order \ n2. Cancel order \ n3. Confirm menu \ n4. Checkout")
    server = int(input("Please choose your option:"))
    if server == 1:
        while True:
            menu_add = input("Please enter the dish number or enter Y to end the order:")
            if menu_add.upper() != 'Y':
                for m in menu_of_list:
                    if m.get('id') == str(menu_add):
                        Order_list.append(m)
                    break
            else:
                print('_______ Ordered successfully _________')
                total_price = 0
                for order in Order_list:
                    print(order.get('name'), order.get('price'), order.get('$'))
                    total_price += int(order.get('price'))
                print('Subtotal: {} yuan'.format(total_price))
                break
    elif server == 2:
        cancel_menu = input("Please enter the name of the dish to be cancelled:")
        for order in Order_list:
            if order.get('id') == int(cancel_menu):
                Order_list.remove(order)

        print('_______ Ordered _________')
        total_price = 0
        for order in Order_list:
            print(order.get('name'), order.get('price'), order.get('$'))
            total_price += int(order.get('price'))
            print('Subtotal: {} yuan'.format(total_price))
    elif server == 3:
        print(' Successfully Ordered')
        total_price = 0
        for order in Order_list:
            print(order.get('name'), order.get('price'), order.get('$'))
            total_price += int(order.get('price'))
            print('Subtotal: {} yuan'.format(total_price))
    elif server == 4:
        print('______Your total price is: _______ ')
        total_price = 0
        for order in Order_list:
            print(order.get('name'), order.get('price'), order.get('$'))
            total_price += int(order.get('price'))

        print('Total consumption: {} yuan'.format(total_price))

        print('Thanks for your choice and Welcome to visit again!')
        break