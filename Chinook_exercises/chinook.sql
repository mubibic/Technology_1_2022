# 1.) How many songs are there in the playlist “Grunge”?
SELECT COUNT(TrackId)
FROM PlaylistTrack
INNER JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
WHERE Playlist.Name = 'Grunge';

SELECT COUNT(*) AS Grunge_songs
FROM playlisttrack
WHERE PlaylistId = (SELECT PlaylistId FROM playlist WHERE Name = 'Grunge');

# 2.) Show information about artists whose name includes the text “Jack”
# and about artists whose name includes the text “John”, but not the text “Martin”.
SELECT *
FROM Artist
LEFT JOIN Album ON Artist.ArtistId = Album.ArtistId
WHERE name LIKE '%Jack%'
OR name LIKE '%John%'
AND name NOT LIKE '%Martin%';


# 3.)For each country where some invoice has been issued, show the total invoice monetary amount,
# but only for countries where at least $100 have been invoiced. Sort the information from higher to lower monetary amount.
SELECT BillingCountry, SUM(Total)
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100
ORDER BY SUM(Total) DESC;


# 4.) Get the phone number of the boss of those employees who have given support to clients
# who have bought some song composed by “Miles Davis” in “MPEG Audio File” format.
SELECT e.Phone, e.ReportsTo
FROM Employee e
INNER JOIN Customer c on e.EmployeeId = c.SupportRepId
INNER JOIN Invoice i on c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine il on i.InvoiceId = il.InvoiceId
INNER JOIN Track t on il.TrackId = t.TrackId
INNER JOIN MediaType mt on t.MediaTypeId = mt.MediaTypeId
WHERE t.Composer = 'Miles Davis'
AND mt.Name = 'MPEG Audio File'
GROUP BY e.Phone,  e.ReportsTo;

SELECT phone
FROM Employee
WHERE EmployeeId IN (SELECT ReportsTo FROM Employee WHERE EmployeeId IN
                        (SELECT SupportRepId FROM Customer WHERE CustomerId IN (
                            SELECT CustomerId FROM Invoice WHERE InvoiceId IN (
                              SELECT InvoiceId FROM InvoiceLine WHERE TrackId IN (
                                SELECT TrackId FROM Track WHERE Composer = 'Miles Davis' AND MediaTypeID IN (
                                  SELECT MediaTypeId FROM MediaType WHERE Name = 'MPEG Audio File'
                                )
                               )
                              )
                             )
                           )
);



#5.) Show the information, without repeated records, of all albums that feature songs of the “Bossa Nova” genre
# whose title starts by the word “Samba”.
SELECT a.Title AS 'Album', g.Name AS 'Genre', COUNT(*)
FROM Album a
INNER JOIN Track t on a.AlbumId = t.AlbumId
INNER JOIN Genre g on t.GenreId = g.GenreId
WHERE g.Name = 'Bossa Nova' AND t.name LIKE 'Samba%'
GROUP BY a.Title ;


#6.) For each genre, show the average length of its songs in minutes (without indicating seconds).
# Use the headers “Genre” and “Minutes”, and include only genres that have any song longer than half an hour.
SELECT g.Name AS 'Genre', SUM((t.Milliseconds / 1000 * 60) % 60) AS 'Minutes'
FROM Genre g
INNER JOIN Track t on g.GenreId = t.GenreId
WHERE t.Milliseconds > 1800000
GROUP BY g.Name;


#7.) How many client companies have no state?
SELECT COUNT(*) AS 'Client companies without state info'
FROM Customer
WHERE State IS NULL;

# 8.) For each employee with clients in the “USA”, “Canada” and “Mexico” show the number of clients from these countries
# s/he has given support, only when this number is higher than 6. Sort the query by number of clients.
# Regarding the employee, show his/her first name and surname separated by a space. Use “Employee” and “Clients” as headers.


SELECT CONCAT(employee.FirstName, ' ', employee.LastName) AS Employee, COUNT(*) AS Clients
FROM employee
INNER JOIN customer ON employee.EmployeeId = customer.SupportRepId
WHERE customer.Country IN ('USA' , 'Canada' , 'Mexico')
GROUP BY CONCAT(employee.FirstName, ' ', employee.LastName)
HAVING COUNT(CustomerId) > 6
ORDER BY Employee;




#9.) For each client from the “USA”, show his/her surname and name (concatenated and separated by a comma) and their fax number.
# If they do not have a fax number, show the text “S/he has no fax”. Sort by surname and first name.
SELECT CONCAT(LastName, ', ', FirstName ) AS 'Client Name', Fax
FROM Customer
WHERE Country = 'USA';


# 10.)For each employee, show his/her first name, last name, and their age at the time they were hired.
SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR ,BirthDate, HireDate) AS 'age when hired'
FROM Employee;