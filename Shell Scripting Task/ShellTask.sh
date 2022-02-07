echo "Create a directory company_info, such that any member of this company can create a file or access a file under it."
mkdir company_info
chmod 777 company_info
ls -l -h 

echo -e "Name,Age,PhoneNumber,Email,Salary,Department,CountryCode\nAllen,22,433 447-7961,Allen@vodafone.com.eg,800,IT,04\nWard,25,724-995-7762,Ward_ward@vodafone.com.eg,1600,Technology,22\nJones,24,987-123-4563,Jones*1@vodafone.com.eg,1250,Technology,04\nBlake,30,433-447-7964,Blake+30@vodafone.com.eg,2975,IT,04\nClark,28,1234567895,Clark.123@vodafone.com.eg,2850,IT,04\nScott,28,123-456-7896,Scott@vodafone-2.com.eg,2450,Technology,22\nKing,26,724-995-7767,King@vodafone.com.eg,3000,Technology,02\nTurner,35,433-447-7968,35Turner@vodafone.com.eg,5000,IT,02\nAdams,24,987 123 4569,Adams@vodafone.com.en.eg,1500,Technology,05 \nJames,22,123-456 (7810),James@vodafone.com.eg,1100,Technology,04\nMiller,23,142-156-7820,Miller-142@vodafone.com.eg,950,Technology,11\nFord,24,(724)-995-7339,Ford@vodafone.com.eg,1300,IT,22\nMartin,31,387-123-2561,Martin@vodafone.com..eg,3000,IT,02\nSmith,33,756-295-7722,Smith33@vodafone.com.eg,5000,Technology,02" > Employees.csv

echo "get total number of employees and print the result on the screen."

awk 'BEGIN{c1=0} //{c1++} END{print "Number of Employees: ",c1 - 1}' Employees.csv 

echo "get number of employees in IT department and write current date and the result into ‘IT_employess_count.txt’ file under company_info directory."

awk -F ','  'BEGIN {c=0; OFS=","} { if ($6 == "IT") {c++}}  END{print strftime("%Y-%m-%d") " Number of Employees in IT Department: " c }' Employees.csv > company_info/IT_employess_count.txt

cat company_info/IT_employess_count.txt

echo "get average employees age and write current date and the result into ‘employess_age_average.txt’ file under company_info directory."

awk -F ',' '{sum+=$2; ++n} END { print strftime("%Y-%m-%d") " average employees age: " sum/n-1 }' Employees.csv > company_info/employess_age_average.txt

cat company_info/employess_age_average.txt

echo "get max, min salary for Technology department and write current date and the result with employee name into ‘technology_salaries.txt’ file under company_info directory.".

awk -F ',' 'BEGIN { max=0 ; min=999999 } {if($6 == "Technology"){if ($5 > max) {max = $5} } {if ($5 < min){min = $5}}  }  END { print strftime("%Y-%m-%d") " max salary: "max " min salary: " min }' Employees.csv > company_info/technology_salaries.txt

cat company_info/technology_salaries.txt

echo "Write a bash script that finds all the invalid email addresses and write all of the employee data into a file ‘employess_invalid_email.txt’." 

#Assume that a vaild email addresses has the following rules:
#o Email should be of the form local@domain.com
#o There can only be alphanumberic characters in the local part email address.
#o The following characters are valid in the local part of the email as long as they are not the first character “- , _ , + , .”
#o Email address can’t start with a number.
#o Domain name can only contain alphanumeric characters.
#o com part can have at most one ., for e.g. com.uk or com.in is valid but com.eg.gh is invalid

awk -F ',' '{ if($4 !~ /^[a-zA-Z0-9._+-]+@[a-zA-Z0-9]+\.+com+\.[a-zA-Z]{2,4}$/ || $4 ~ /^[0-9]/) {print $4}} ' Employees.csv > company_info/employess_invalid_email.txt

echo "Write a bash script to get all invalid phone numbers and write all of the employee data into a file ‘employess_invalid_numbers.txt’."
#You may assume that a valid phone number must appear in this format xxx-xxx-xxxx.

awk -F ',' '{ if($3 !~ /^[0-9]{3}+\-[0-9]{3}+\-[0-9]{4}/ ) {print $3}} ' Employees.csv > company_info/employess_invalid_numbers.txt

echo "Write a bash script to combine both CountryCode and PhoneNumber with a - and add a + before country code"
#like +countrycode-phonenumber and remove country codes from the csv file."

awk -F ',' '{ $7 = "+"$7"-"$3 ;}1' Employees.csv > Employees.tmp && mv Employees.tmp Employees.csv


echo "list files under company_info."

ls company_info