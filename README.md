# EventVenue Booking Platform

A comprehensive event and venue booking platform built with Next.js (frontend) and Spring Boot (backend).

## Features

- **User Management**: Sign up, login, OTP verification
- **Venue Booking**: Browse and book venues with flexible date selection
- **Event Booking**: Browse events, select seats, and book tickets
- **Points System**: Earn and redeem points on bookings
- **Vendor Dashboard**: Manage venues, events, and view analytics
- **Admin Panel**: Approve vendors, manage system settings, view platform analytics
- **Payment Integration**: PayPal payment gateway
- **Email Notifications**: Automated booking confirmations and OTP emails

## Tech Stack

### Frontend
- **Framework**: Next.js 14 with TypeScript
- **Styling**: Tailwind CSS
- **UI Components**: shadcn/ui, Radix UI
- **Forms**: React Hook Form with Zod validation
- **State Management**: React Context
- **Charts**: Recharts
- **Maps**: Google Maps API

### Backend
- **Framework**: Spring Boot 3.2.0
- **Language**: Java 17
- **Database**: PostgreSQL (Supabase)
- **Security**: JWT Authentication, BCrypt password hashing
- **Email**: SMTP (Gmail)
- **Build Tool**: Maven

## Prerequisites

- **Node.js** 18+ and npm
- **Java** 17+
- **Maven** 3.6+
- **PostgreSQL** database (or Supabase account)
- **Google Maps API** key
- **PayPal Developer** account
- **Gmail** account with App Password (for email notifications)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Pranai222/Sharework_eventvenue.git
cd eventvenuebookingplatform72224233
```

### 2. Frontend Setup

```bash
# Install dependencies
npm install

# Create environment file
cp .env.example .env.local

# Edit .env.local and add your API keys:
# - NEXT_PUBLIC_GOOGLE_MAPS_API_KEY
# - PAYPAL_CLIENT_ID
# - PAYPAL_CLIENT_SECRET
# - NEXT_PUBLIC_API_URL (http://localhost:8080 for development)

# Start development server
npm run dev
```

The frontend will be available at `http://localhost:3000`

### 3. Backend Setup

```bash
cd backend

# Update application.properties with your configuration:
# - Database connection (PostgreSQL/Supabase)
# - Email SMTP credentials (Gmail App Password)
# - PayPal credentials (if different from frontend)

# Run the backend
mvn spring-boot:run
```

The backend API will be available at `http://localhost:8080`

### 4. Database Setup

The application uses PostgreSQL. You can:

**Option A: Use Supabase (Recommended)**
1. Create account at https://supabase.com
2. Create a new project
3. Get the connection string from Project Settings > Database
4. Update `application.properties` with your connection details
5. Run the schema SQL file to create tables

**Option B: Local PostgreSQL**
1. Install PostgreSQL locally
2. Create database: `CREATE DATABASE eventvenue;`
3. Update `application.properties` with local connection
4. Run the schema SQL file

### 5. Required API Keys & Credentials

#### Google Maps API
1. Go to https://console.cloud.google.com/
2. Create a new project or select existing
3. Enable APIs:
   - Maps JavaScript API
   - Geocoding API
   - Places API
4. Create credentials (API Key)
5. Add to `.env.local`: `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY`

#### PayPal Developer Account
1. Go to https://developer.paypal.com/
2. Create a PayPal Business account
3. Go to Dashboard > My Apps & Credentials
4. Create a new app
5. Copy Client ID and Secret
6. Add to `.env.local`:
   - `PAYPAL_CLIENT_ID`
   - `PAYPAL_CLIENT_SECRET`

#### Gmail SMTP (App Password)
1. Enable 2-Factor Authentication on your Gmail account
2. Go to https://myaccount.google.com/apppasswords
3. Generate a new app password for "Mail"
4. Update `backend/src/main/resources/application.properties`:
   ```properties
   spring.mail.username=your_email@gmail.com
   spring.mail.password=your_16_character_app_password
   ```

## Project Structure

```
eventvenuebookingplatform72224233/
├── app/                        # Next.js app directory
├── components/                 # React components
├── lib/                        # Utility functions
├── public/                     # Static assets
├── backend/
│   ├── src/main/java/         # Java source code
│   │   └── com/eventvenue/
│   │       ├── controller/    # REST controllers
│   │       ├── service/       # Business logic
│   │       ├── repository/    # Data access
│   │       ├── entity/        # JPA entities
│   │       ├── dto/           # Data transfer objects
│   │       └── security/      # Security config
│   └── src/main/resources/
│       └── application.properties
└── .env.example               # Environment variables template
```

## Running in Production

### Frontend (Vercel)
1. Push code to GitHub
2. Import project in Vercel
3. Add environment variables in Vercel dashboard
4. Deploy

### Backend (Railway/Render)
1. Create account on Railway or Render
2. Create new service from GitHub repo
3. Set environment variables
4. Deploy

## Default Admin Credentials

After setting up the database, you can create an admin user or use the default:
- Email: Check database after first run
- Password: Set during signup

## Troubleshooting

### Frontend won't start
- Check that all required environment variables are set in `.env.local`
- Run `npm install` to ensure dependencies are installed
- Check that port 3000 is not in use

### Backend won't start
- Verify database connection in `application.properties`
- Ensure PostgreSQL is running
- Check that port 8080 is available
- Verify Java 17+ is installed: `java -version`

### Email not sending
- Verify Gmail App Password is correct
- Check 2FA is enabled on Gmail account
- Look for errors in backend console

### PayPal payments failing
- Ensure using Sandbox credentials for testing
- Verify Client ID and Secret are correct
- Check PayPal Developer Dashboard for app status

## License

This project is for educational purposes.

## Support

For issues or questions, please open an issue on GitHub.
