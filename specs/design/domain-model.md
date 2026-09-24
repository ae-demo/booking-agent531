# Domain Model

The booking agent tracks one business's services, the working hours and time
off of its staff, and the appointments customers book against that
availability.

```mermaid
erDiagram
    SERVICE {
        string id
        string name
        string description
        int durationMinutes
        boolean active
    }
    STAFF_MEMBER {
        string id
        string userId
        string displayName
    }
    AVAILABILITY_RULE {
        string id
        string staffId
        int dayOfWeek
        string startTime
        string endTime
    }
    TIME_OFF {
        string id
        string staffId
        datetime startsAt
        datetime endsAt
        string reason
    }
    BOOKING {
        string id
        string customerId
        string serviceId
        string staffId
        datetime startsAt
        datetime endsAt
        string status
        datetime createdAt
    }

    STAFF_MEMBER ||--o{ AVAILABILITY_RULE : "sets"
    STAFF_MEMBER ||--o{ TIME_OFF : "blocks"
    STAFF_MEMBER ||--o{ BOOKING : "fulfils"
    SERVICE ||--o{ BOOKING : "booked as"
    BOOKING }o--|| SERVICE : "for"
```

- A **Service** is offered by the business; only `active` services can be booked.
- A **StaffMember** links a signed-in Staff user to their availability and bookings.
- An **AvailabilityRule** is a recurring weekly working-hours slot; a **TimeOff**
entry blocks part of that recurring availability for a specific date range.
- A **Booking** reserves one service, at one time slot, with one staff member,
for the customer who made it; `status` is one of `confirmed` or `cancelled`.

