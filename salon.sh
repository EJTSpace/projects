#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
   #get available services
    AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")

  #display available services
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done

    #ask for bike to rent
      echo -e "\nWhich one would you like?"
      read SERVICE_ID_SELECTED

   #if input is not a number
     if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
     then
          #send to main menu
          MAIN_MENU
     else
          #get service availability
          SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
          #if not available
          if [[ -z $SERVICE_NAME ]] 
          then
            #send to main menu
            MAIN_MENU
	  else 
            #get customer info
            echo -e "\nWhat's your phone number?"
            read CUSTOMER_PHONE
            CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
            #if customer doesn't exist
                if [[ -z $CUSTOMER_NAME ]]
                then
                  # get new customer name
                  echo -e "\nWhat's your name?"
                  read CUSTOMER_NAME

                  # insert new customer
                  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
                fi
	#get preferred time
	      echo -e "\nWhat time would you like?"
              read SERVICE_TIME
	#get customer ID
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
	#add appointment
	INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED','$SERVICE_TIME')")

	echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
	  fi
     fi

}
MAIN_MENU