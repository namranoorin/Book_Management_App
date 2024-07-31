#! /bin/bash

add_book()
{
    read -p "Enter Name of the book to Add:" newBook
    books[$i]=$newBook
    let i++
    echo "$newBook Added Successfully"
    echo
}
delete_book(){
   read -p "Enter book to delete:" book_to_delete 
   Avab="no"
   for index in ${!books[@]}
do
if [ ${books[$index]} = $book_to_delete ]; then
Avab="yes"
unset books[$index]
echo "$book_to_delete Book Deleted Succesfully"
echo
break
fi
done
if [ $Avab = "no" ]; then
echo "$book_to_delete Book is not available, cannot be deleted"
echo
fi
}
list_book(){
    if [ ${#books[@]} -eq 0 ]; then
    echo "No Books are Available"
    echo
    return 1
    fi
    echo "Lst Of All Available Books"
    echo "---------------------"
    for book in ${books[@]}
    do 
        echo $book
    done   
    echo 

}
echo "Welcome to DURGASOFT book Management Application"
echo "###################################################"

declare -a books
i=0;
while [ true ]
do
  read -p "Which Operation you want to perform [add|delete|list|exit]:" option
case $option in 
  add)
    add_book
    ;;
    delete)
    delete_book
    ;;
    list)
    list_book
    ;;
    exit)
    echo "Thanks For Using Our Application"
    exit 0
    ;;
    *)
   echo "Wrong Option , try Again"
    esac
done