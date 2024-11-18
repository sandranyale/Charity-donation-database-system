# Charity-donation-database-system
Uwezo Charity Donation System Database
This document contains information about the SQL dump file for the Uwezo Charity Donation System database. It is designed to automate donation records and fund allocations. It is also designed to manage and store information about donations, donors, charities, receipts, and staff involved in the system. 
Database Overview
The database consists of the following tables:
charity
Stores details about various charity programs.
**Columns:**
•	`charity_id`: Primary Key, unique identifier for each charity.
•	`name`: Name of the charity program.
•	`descr`: Description of the program.
•	`start_date`: Start date of the program.
•	`end_date`: End date of the program.
donation
Records donations made by donors to specific charities.
**Columns:**
•	`donation_id`: Primary Key, unique identifier for each donation.
•	`donor_id`: Foreign Key, references the donor who made the donation.
•	`charity_id`: Foreign Key, references the charity receiving the donation.
•	`amount`: Amount donated.
•	`date`: Date of the donation.
•	`payment_method`: Payment method used (e.g., Cash, M-Pesa).
donor
Contains information about donors.
**Columns:**
•	`donor_id`: Primary Key, unique identifier for each donor.
•	`fname`: First name of the donor.
•	`lname`: Last name of the donor.
•	`email`: Email address of the donor (unique).
•	`phone_number`: Contact number of the donor.
•	`address`: Address of the donor.
receipt
Tracks receipts issued for donations.
**Columns:**
•	`receipt_id`: Primary Key, unique identifier for each receipt.
•	`donation_id`: Foreign Key, references the corresponding donation.
•	`issued_date`: Date the receipt was issued.
•	`amount`: Amount specified in the receipt.
•	`receipt_content`: Description or purpose of the donation.
staff
Details staff members involved in the charity system.
**Columns:**
•	`staff_id`: Primary Key, unique identifier for each staff member.
•	`fname`: First name of the staff member.
•	`lname`: Last name of the staff member.
•	`roles`: Role of the staff member (e.g., CEO, Accountant).
•	`email`: Email address of the staff member (unique).
•	`phone_number`: Contact number of the staff member.
staff_event
Links staff members to specific charity programs they oversee or manage.
**Columns:**
•	`staff_id`: Foreign Key, references the staff member.
•	`charity_id`: Foreign Key, references the charity program.
Setup Instructions
To set up the database:
1.	Ensure you have MySQL installed on your system.
2.	Open your MySQL client or command line interface.
3.	Create the database:
4.	```sql
CREATE DATABASE uwezocharitydonationsys;
```
5.	Use the newly created database:
6.	```sql
USE uwezocharitydonationsys;
```
7.	Import the SQL dump file:
8.	```bash
mysql -u [username] -p uwezocharitydonationsys < uwezocharitydonationsys.sql
```
9.	Replace `[username]` with your MySQL username.
10.	The database will now be ready for use.
Notes
**Foreign Key Relationships:**
•	`donation.donor_id` → `donor.donor_id`
•	`donation.charity_id` → `charity.charity_id`
•	`receipt.donation_id` → `donation.donation_id`
•	`staff_event.staff_id` → `staff.staff_id`
•	`staff_event.charity_id` → `charity.charity_id`
Ensure the InnoDB storage engine is enabled for proper enforcement of foreign keys.
Data
The SQL dump includes sample data for testing and demonstration purposes.
Contact
For questions or contributions, contact the database administrators at 1049087@cuea.edu, 1049490@cuea.edu, 1049387@cuea.edu, 1050304@cuea.edu and 1049474@cuea.edu, 

