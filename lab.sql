


PROMPT ==========================================
PROMPT Question 1
PROMPT Display all agents who specialize in US travel packages
PROMPT ==========================================

SELECT last_name  "LAST_NAME",
       first_name "FIRST_NAME",
       agent_level "AGEN"
FROM   rcv_agents
WHERE  specialization = 'US'
ORDER BY last_name;

clear columns


PROMPT ==========================================
PROMPT Question 2
PROMPT Tours in France and Spain costing $100 or less
PROMPT ==========================================

-- Format columns
column "Destination Desc" format A80
column country format A15
column city format A10
column price format 999.99

SELECT destination_desc "Destination Desc",
       country          "COUNTRY",
       state            "ST",
       city             "CITY",
       price            "PRICE"
FROM   rcv_tours
WHERE  country IN ('France','Spain')
AND    price <= 100
ORDER BY country, state, city, price;

clear columns


PROMPT ==========================================
PROMPT Question 3
PROMPT Customers in California with phone starting with 310
PROMPT ==========================================

SELECT first_name "First",
       last_name  "Last",
       phone      "Phone",
       state      "Prov"
FROM   rcv_customers
WHERE  state = 'CA'
AND    phone LIKE '310%'
ORDER BY last_name, first_name;

clear columns

-- Stop spool
spool off
