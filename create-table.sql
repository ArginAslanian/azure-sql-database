CREATE TABLE Bookings (
    BookingID INT IDENTITY(1000, 1) PRIMARY KEY,
    CustomerFirstName NVARCHAR(50) NOT NULL,
    CustomerLastName NVARCHAR(50) NOT NULL,
    CustomerEmail NVARCHAR(100) NOT NULL,
    CustomerPhone NVARCHAR(20) NULL,
    VehicleType NVARCHAR(50) NOT NULL,
    PickupLocation NVARCHAR(255) NOT NULL,
    DropoffLocation NVARCHAR(255) NOT NULL,
    PickupDateTime DATETIME2 NOT NULL,
    PassengerCount INT NOT NULL,
    SpecialRequests NVARCHAR(1000) NULL,
    BookingStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending',
    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE()
);