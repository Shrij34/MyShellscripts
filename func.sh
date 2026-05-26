 #!/bin/bash
 customer_name="Ram"

 say_name(){
    echo "Hi $customer_name, My name is $1 i am your AI assitance, i am here to help you with your queries"
    echo "Please choose an option:"
    echo "1: Wifi down"
    echo "2: Router issues"
    echo "3: Other issues"
    read -p "please choose an 1,2,3:  " option

    if [ "$option" == "1" ]; then
        if  curl -Is https://www.google.com --max-time 5 | grep "200" > /dev/null; then
                echo "Your wifi is working fine" >> log.txt
            else
                echo "Your wifi is down, please check your connection" >> log.txt
        fi

    elif [ "$option" == "2" ]; then
            echo "for router issues, please try restarting your router and check if the issue is resolved" >> log.txt
            echo "if the issue persists, please contact us on 1-800-123-4567 for further assistance" >> log.txt


    elif [ "$option" == "3" ];  then
            echo "for other issues, please contact us on 1-800-123-4567 for further assistance" >> log.txt
    else
            echo "Invalid option, please try again" >> log.txt
    fi
}

say_name "Sriji"
cat log.txt




