# Booking Agent — PRD

## Problem Statement

Small service businesses — salons, clinics, consultants and similar single-location
practices — typically juggle phone calls, walk-ins and paper or spreadsheet
calendars to manage appointments. Customers have no way to see real availability
or book for themselves, and staff waste time on scheduling calls and manually
resolving double-bookings.

## Solution

A booking agent web application where a business's staff define the services they
offer and their own availability, and customers browse that availability and book
appointments themselves — with staff able to see, adjust and manage the resulting
schedule from one calendar view.

## Actors

- **Customer** — browses services and available time slots, books, views, cancels
or reschedules their own appointments.
- **Staff** — the business's own staff/admin; defines services, sets working
hours and time off, views the full appointment calendar, and can cancel or
reschedule any customer's booking on their behalf.

## User Stories

1. As a Customer, I want to sign in, so that my bookings are saved to my account and I can manage them later.
2. As a Customer, I want to browse the services a business offers and read their descriptions, so that I can choose what to book.
3. As a Customer, I want to see available time slots for a chosen service, so that I can pick a convenient time.
4. As a Customer, I want to book an appointment for a chosen service and time slot, so that my visit is reserved.
5. As a Customer, I want to view my upcoming and past bookings, so that I can keep track of my appointments.
6. As a Customer, I want to cancel or reschedule an upcoming booking, so that I can adjust my plans.
7. As a Staff member, I want to sign in securely, so that only authorized staff can manage the business's services and bookings.
8. As a Staff member, I want to define the services offered (name, duration, description), so that customers can book them.
9. As a Staff member, I want to set my working hours and availability, so that customers only see slots I can actually take.
10. As a Staff member, I want to block out time (e.g. holidays, breaks), so that customers cannot book during that time.
11. As a Staff member, I want to view all upcoming bookings on a calendar, so that I know my schedule at a glance.
12. As a Staff member, I want to cancel or reschedule a customer's booking on their behalf, so that I can handle exceptions such as illness or emergencies.

## Product Decisions

- **Sign-in**: every user (Customer and Staff) authenticates via SSO through
Thunder, the platform IDP.
- **Payment**: not required at booking time — booking only reserves a slot; any
payment happens outside this system, e.g. in person.
- **Notifications**: none for now — no email or SMS confirmations, reminders or
cancellation notices are sent by this system.
- **Scope of the business**: the system serves a single business with a single
location and a single shared calendar; every Staff member manages the same
business, not their own separate one.
- **Staff role**: Staff is one combined role — every signed-in staff member can
define services, set availability, and manage any booking; there is no
separate, more restricted "front-desk" role.
- **Cancellation/reschedule window**: a Customer may cancel or reschedule their
own booking at any time before it starts — there is no minimum notice cutoff
enforced by the system.

## Out of Scope

- Multiple independent businesses or providers (marketplace-style booking).
- Payment processing, deposits, or refunds.
- Email or SMS notifications, confirmations, or reminders.
- Recurring/repeating bookings and waitlists.
- Reviews, ratings, or public business discovery.

## Open Questions

*(none — all decisions needed to write this PRD were either answered directly or reasonably assumed and flagged above)*