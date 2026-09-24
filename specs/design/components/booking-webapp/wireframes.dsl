screen Services "Browse the business's active services"
  navbar "Booking Agent"
  sidebar "Services -> Services | My Bookings -> MyBookings"
  heading "Services"
  search "Search services"
  table "Service | Duration | Description"
    row "Haircut | 30 min | Classic cut and style -> ServiceSlots"
    row "Colour | 90 min | Full colour treatment -> ServiceSlots"
    row "Manicure | 45 min | Hand care and polish -> ServiceSlots"

screen ServiceSlots "Pick an open time slot for the chosen service"
  navbar "Booking Agent"
  sidebar "Services -> Services | My Bookings -> MyBookings"
  heading "Haircut — 30 min"
  text "Classic cut and style"
  select "Choose a date"
  table "Time | Staff"
    row "09:00 | Jane Doe -> BookingConfirm"
    row "10:00 | Jane Doe -> BookingConfirm"
    row "14:30 | Sam Lee -> BookingConfirm"

screen BookingConfirm "Confirm the chosen slot"
  navbar "Booking Agent"
  sidebar "Services -> Services | My Bookings -> MyBookings"
  heading "Confirm your booking"
  card "Haircut"
    text "Tue 30 Sep, 09:00 — with Jane Doe"
  row
    button "Cancel" -> ServiceSlots
    right
    button "Confirm Booking" primary -> MyBookings

screen MyBookings "The signed-in customer's own bookings"
  navbar "Booking Agent"
  sidebar "Services -> Services | My Bookings -> MyBookings"
  heading "My Bookings"
  tabs "Upcoming | Past"
  table "Service | Staff | When | Status"
    row "Haircut | Jane Doe | Tue 30 Sep, 09:00 | Confirmed -> BookingDetail"
    row "Colour | Sam Lee | Fri 3 Oct, 14:30 | Confirmed -> BookingDetail"

screen BookingDetail "Manage one of the customer's own bookings"
  navbar "Booking Agent"
  sidebar "Services -> Services | My Bookings -> MyBookings"
  heading "Haircut — Tue 30 Sep, 09:00"
  text "With Jane Doe"
  badge "Confirmed" success
  row
    button "Reschedule" -> ServiceSlots
    right
    button "Cancel Booking" danger -> MyBookings

screen StaffCalendar "Staff's full appointment calendar"
  navbar "Booking Agent"
  sidebar "Calendar -> StaffCalendar | Services -> ManageServices | Availability -> ManageAvailability"
  heading "Calendar"
  row
    select "This week"
    right
    button "Block Time Off" -> ManageAvailability
  table "Time | Service | Customer | Staff | Status"
    row "09:00 | Haircut | A. Nguyen | Jane Doe | Confirmed -> StaffBookingDetail"
    row "10:00 | Manicure | R. Silva | Sam Lee | Confirmed -> StaffBookingDetail"

screen StaffBookingDetail "Staff view of one booking, with override actions"
  navbar "Booking Agent"
  sidebar "Calendar -> StaffCalendar | Services -> ManageServices | Availability -> ManageAvailability"
  heading "Haircut — 09:00, Tue 30 Sep"
  text "Customer: A. Nguyen · Staff: Jane Doe"
  badge "Confirmed" success
  row
    button "Reschedule" -> StaffCalendar
    right
    button "Cancel Booking" danger -> StaffCalendar

screen ManageServices "Staff defines and edits the services offered"
  navbar "Booking Agent"
  sidebar "Calendar -> StaffCalendar | Services -> ManageServices | Availability -> ManageAvailability"
  row
    heading "Services"
    right
    button "New Service" primary -> ServiceForm
  table "Service | Duration | Active"
    row "Haircut | 30 min | Yes -> ServiceForm"
    row "Colour | 90 min | Yes -> ServiceForm"

screen ServiceForm "Create or edit a service"
  navbar "Booking Agent"
  sidebar "Calendar -> StaffCalendar | Services -> ManageServices | Availability -> ManageAvailability"
  heading "Service Details"
  input "Name"
  textarea "Description"
  input "Duration (minutes)"
  toggle "Active" active
  row
    button "Cancel" -> ManageServices
    right
    button "Save Service" primary -> ManageServices

screen ManageAvailability "Staff sets weekly working hours and blocks time off"
  navbar "Booking Agent"
  sidebar "Calendar -> StaffCalendar | Services -> ManageServices | Availability -> ManageAvailability"
  heading "Availability"
  card "Weekly Working Hours"
    table "Day | Start | End"
      row "Monday | 09:00 | 17:00"
      row "Tuesday | 09:00 | 17:00"
    button "Add Working Hours" -> AvailabilityForm
  card "Time Off"
    table "From | To | Reason"
      row "2 Oct 18:00 | 3 Oct 09:00 | Personal"
    button "Block Time Off" -> AvailabilityForm

screen AvailabilityForm "Add a working-hours rule or a time-off block"
  navbar "Booking Agent"
  sidebar "Calendar -> StaffCalendar | Services -> ManageServices | Availability -> ManageAvailability"
  heading "Add Availability"
  tabs "Working Hours | Time Off"
  select "Day of week"
  input "Start time"
  input "End time"
  row
    button "Cancel" -> ManageAvailability
    right
    button "Save" primary -> ManageAvailability

flow "Book an appointment"
  role "Customer"
  description "A customer browses services, finds a slot and books it"
  Services
  ServiceSlots
  BookingConfirm
  MyBookings
  BookingDetail

flow "Manage schedule and bookings"
  role "Staff"
  description "Staff defines services and availability, then manages the calendar"
  StaffCalendar
  StaffBookingDetail
  ManageServices
  ServiceForm
  ManageAvailability
  AvailabilityForm
