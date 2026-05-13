CREATE USER [FleetBookingAutomator] FROM EXTERNAL PROVIDER;  /* FleetBookingAutomator is the name of the Logic App */
ALTER ROLE db_datareader ADD MEMBER [FleetBookingAutomator];
ALTER ROLE db_datawriter ADD MEMBER [FleetBookingAutomator];