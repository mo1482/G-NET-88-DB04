USE HotelReservationSystem;
GO


-- =========================================
-- 1. INSERT OPERATIONS
-- =========================================

-- Insert a Guest

INSERT INTO Guests
(
    FullName,
    Nationality,
    PassportNumber,
    DateOfBirth
)
VALUES
(
    'Ahmed Mohamed',
    'Egyptian',
    'A12345678',
    '2000-05-15'
);
GO


-- Insert Multiple Guests in One Statement

INSERT INTO Guests
(
    FullName,
    Nationality,
    PassportNumber,
    DateOfBirth
)
VALUES
(
    'Mohamed Ali',
    'Egyptian',
    'A11111111',
    '1998-03-20'
),
(
    'Omar Hassan',
    'Egyptian',
    'A22222222',
    '1995-08-10'
),
(
    'John Smith',
    'American',
    'US3333333',
    '1992-11-25'
);
GO


-- =========================================
-- 2. UPDATE OPERATIONS
-- =========================================

-- Increase DailyRate by 15% for all Suites

UPDATE Rooms
SET DailyRate = DailyRate * 1.15
WHERE RoomType = 'Suite';
GO


-- Update ReservationStatus

UPDATE Reservations
SET ReservationStatus =
    CASE
        WHEN CheckOutDate < GETDATE()
            THEN 'Completed'

        WHEN CheckInDate > GETDATE()
            THEN 'Upcoming'

        ELSE 'Active'
    END;
GO


-- =========================================
-- Verification
-- =========================================

SELECT *
FROM Guests;
GO

SELECT *
FROM Rooms;
GO

SELECT *
FROM Reservations;
GO