# Starship Comm

## Overview

Starship Comm is a space-themed e-commerce platform with a dynamic pricing engine that adjusts product prices in real-time based on space events, rare item categories, and flash auctions.

## Features

- Import Products from CSV
- Show Product Details
- Place Orders
- Dynamic Pricing Engine

## Dynamic Pricing Engine

The pricing engine adjusts product prices based on:
- **Random Space Events**: Solar storms increase prices by 2-12%. Full moons decrease prices by 3-42%.
- **Rare Items**: Categories such as "Alien Artifacts" and "Space Crystals" may have their prices doubled randomly.
- **Flash Auctions**: Selected products are auctioned starting at 50% of their price and increase over time.

## API Endpoints

- **GET /products**: Retrieve all products.
- **GET /products/:id**: Retrieve a single product.
- **POST /orders**: Place an order.

## Setup and Run Locally

1. Clone the repository.
2. Install dependencies: `bundle install`
3. Setup MongoDB and Redis.
4. Start the Rails server: `rails server`
5. Start Sidekiq: `bundle exec sidekiq`

## Example Requests

### Get all products
```bash
curl -X GET http://localhost:3000/products
