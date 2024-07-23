--view- combine data Donation, Donor, Person, Paramedic to provide info about donation.

CREATE VIEW DonationDetails AS
SELECT 
    d.donation_id,
    d.donation_date,
    d.pass_tests,
    d.valid,
    dp.place_id,
    dp.place_phone,
    dp.manager,
    dp.address,
    r.hospital_id,
    r.hospital_name,
    r.city,
    r.delivery_date,
    r.hospital_phone,
    p1.pid AS donor_id,
    p1.l_name AS donor_last_name,
    p1.f_name AS donor_first_name,
    p2.pid AS paramedic_id,
    p2.l_name AS paramedic_last_name,
    p2.f_name AS paramedic_first_name
FROM 
    Donation d
JOIN 
    Donor dn ON d.donor_id = dn.donor_id
JOIN 
    Person p1 ON dn.donor_id = p1.pid
JOIN 
    Paramedic pm ON d.paramedic_id = pm.paramedic_id
JOIN 
    Person p2 ON pm.paramedic_id = p2.pid
LEFT JOIN 
    Donation_place dp ON d.place_id = dp.place_id
LEFT JOIN 
    Receiver r ON d.hospital_id = r.hospital_id;


--check
select * from DonationDetails


--query 1- List total num of donations made by all donor, with their details and the number of valid donations

SELECT 
    d.donor_id,
    p.l_name AS donor_last_name,
    p.f_name AS donor_first_name,
    COUNT(d.donation_id) AS total_donations,
    SUM(CASE WHEN d.valid = 'Y' THEN 1 ELSE 0 END) AS valid_donations
FROM 
    Donation d
JOIN 
    Donor dr ON d.donor_id = dr.donor_id
JOIN 
    Person p ON dr.donor_id = p.pid
GROUP BY 
    d.donor_id, p.l_name, p.f_name
ORDER BY 
    total_donations DESC;



-- query 2-get all donations that did not pass test and details of the donor and paramedics involved

SELECT 
    d.donation_id,
    d.donation_date,
    d.pass_tests,
    p1.pid AS donor_id,
    p1.l_name AS donor_last_name,
    p1.f_name AS donor_first_name,
    p2.pid AS paramedic_id,
    p2.l_name AS paramedic_last_name,
    p2.f_name AS paramedic_first_name
FROM 
    Donation d
JOIN 
    Donor dr ON d.donor_id = dr.donor_id
JOIN 
    Person p1 ON dr.donor_id = p1.pid
JOIN 
    Paramedic pm ON d.paramedic_id = pm.paramedic_id
JOIN 
    Person p2 ON pm.paramedic_id = p2.pid
WHERE 
    d.pass_tests = 'N';






