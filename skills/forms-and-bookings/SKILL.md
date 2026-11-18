---
name: forms-and-bookings
description: Add contact forms, quote requests, booking links and simple order/reservation flows to static local business sites without a backend — Netlify Forms or alternatives, spam protection, notifications, GDPR consent, and integrating external booking engines (Booking, Airbnb, restaurant and appointment tools). Use when a site needs a form, reservations, appointments or quote requests.
---

# Forms and bookings

First question: does the business really need a form? For most local businesses, call and
WhatsApp convert better. Add a form when: the owner can't answer the phone during work, quotes
need details/photos, B2B enquiries, job applications, or out-of-hours requests.

## Static form options

| Option | Notes |
|---|---|
| **Netlify Forms** | `data-netlify="true"` + hidden `form-name`; free tier limited monthly submissions; email notifications to the client; spam filter + honeypot. Default when hosting on Netlify. |
| Formspree / Basin / Web3Forms | Work on any host; check data location and privacy terms. |
| Google Forms embed | Quick but off-brand and heavier; acceptable for job applications. |
| `mailto:` link | No collection, simplest; fine as fallback. |

## Form rules

- Few fields: name, phone or email, message; add only what the owner truly uses (dates,
  number of guests, service type, town).
- Labels visible, `autocomplete` attributes, `type="tel"`/`email`, required marked.
- Honeypot field + provider spam filter; avoid CAPTCHAs that hurt older users unless spam
  is a real problem.
- Success page/message that says what happens next ("we reply within 24 h; urgent? call…").
- Privacy info layer next to submit (see `legal-pages`). Notifications go to the client's email
  (set in the hosting dashboard, in the client's account).
- Test a real submission before launch and confirm the client received it.

## Bookings

- **Rural houses/hotels**: if they're on Booking/Airbnb, link to listings *and* offer direct
  contact (direct bookings avoid commission). For a direct booking engine/channel manager, link
  or embed the client's provider; do not build availability calendars from scratch.
- **Restaurants**: link to their reservation tool or phone/WhatsApp; never promise table
  availability the site can't know.
- **Appointments** (hairdressers, clinics, workshops): link to their scheduling tool (e.g.
  Google Calendar appointment schedules, Calendly, sector apps), opened in a new tab or embedded
  click-to-load.
- **Orders** (bakery, farm boxes): a structured WhatsApp message or a form; real online
  payments = separate e-commerce scope.

## Measurement

Tag submit buttons and booking links with `data-contact="form|book"`; count conversions in
analytics without personal data (`analytics-and-reporting`).
