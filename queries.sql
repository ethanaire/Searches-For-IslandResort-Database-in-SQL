USE resort_db;

-- Task 1: Print all the details (ID, Name, Cost) of the villa. Note that the cost must be prefixed with a '$' sign. Sort the records in order of price with the most expensive villa at the top of the list.
SELECT VillaID, VillaName, concat('$', VillaCostPerDay) 'VillaCostPerDay'
FROM Villa
ORDER BY VillaCostPerDay DESC;

-- Task 2: print the reservation details (VillaID, check in and out dates, along with the number of days) that each of the villas in the reservation are reserved for.
SELECT VillaID, DateFrom, DateTo, DATEDIFF(DateTo, DateFrom) 'Length of stay'
FROM Villa_Reservation; 

-- Task 3: print the all details (Name, Cost) of the villa if they are two-bedroom villas.
SELECT V.VillaName, V.VillaCostPerDay
FROM VillaType VT, Villa V
WHERE V.VillaID = VT.VillaID
AND VT.VillaTypeName like '%two-bedroom%';

-- Task 4: Print the ReservationID if the reservation was paid for within 5 days from the date of reservation. Please ensure no duplicate results are included.
SELECT DISTINCT R.ReservationID
FROM Reservation R, Payment P
WHERE R.ReservationID = P.ReservationID 
AND DATEDIFF(PaymentDate,ReservationDate) <= 5;

-- Task 5: Print Customer names and phone numbers, if they have made a reservation (reservation date) within the last 6 months calculated from today
SELECT C.CustomerID, C.CustomerPhNum
FROM Customer C, Reservation R
WHERE C.CustomerID = R.CustomerID
AND R.ReservationDate between adddate(curdate(), interval - 6 month) and curdate();

-- Task 6: Print all the names of customers who have booked villas that costs less than $1000 per day.

-- Task 7: Print the total amount of payments that have been made for each reservation.

-- Task 8: Print the reservation details (ID, Date) along with the number of villas that have been booked for each reservation, but only show the reservation details if the number of villas reserved are more than one.

-- Task 9: Print the details of all villas which have never been booked.

-- Task 10: Print the details of any payment that is more $1500. Only include the payments that have been made in either January of any year or in any months in the year of 2020 or the year of 2018. Sort the results by payment amount in descending order.

-- Task 11: Print the details of any payment that has been made on a reservation of a one-bedroom villa by a customer whose surname begins with J.

-- Task 12: Print the ReservationID and the total amount that it has costed (Cost of villa per night * number of days it has been reserved for). Only include reservations that exceed a total amount of $10,000.

-- Task 13: Print the names of the customers who have made bookings of outdoor activities those of which have a cost that is strictly less than the average cost of outdoor activities.

-- Task 14: Print the names of the customers and all the activities they have booked in the afternoon (after mid-day and before 4pm) along with the names of the guides. Only include guides who are Managers.

-- Task 15: Print the names of Staff and their managers, only if the managers manage 2 staff or more

-- Task 16: Print the details of activity booking and the names of staff involved in the activities.

-- Task 17: List the details of package activities along with the details of its least expensive sub activities

-- Task 18: 
