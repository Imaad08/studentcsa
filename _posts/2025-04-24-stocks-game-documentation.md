---
layout: base
permalink: /stocks/game/documentation
title: Stocks 5-Year Game Documentation
---

# Stocks 5-Year Game Documentation

## Overview

The Stocks 5-Year Game is an educational simulation that allows users to experience stock market investing over a 5-year period. Users start with a virtual balance of $10,000, select stocks to invest in, and then simulate how those investments would have performed over a 5-year period based on historical data.

## Features

### 1. Stock Selection Interface

- **User-friendly Dashboard**: Clean, intuitive interface for stock selection
- **Real-time Balance Tracking**: Shows available funds as stocks are added/removed
- **Stock Search**: Search for any publicly traded stock by symbol
- **Quantity Selection**: Specify how many shares to purchase
- **Portfolio Management**: Add and remove stocks from your virtual portfolio

### 2. Simulation Engine

- **5-Year Historical Data**: Uses actual historical stock prices from 5 years ago
- **Realistic Market Behavior**: Simulates market growth and decline based on real data
- **Portfolio Value Calculation**: Computes the total value of your portfolio after 5 years
- **Balance Updates**: Automatically updates your account balance based on simulation results

### 3. User Experience

- **Responsive Design**: Works on desktop and mobile devices
- **Visual Feedback**: Clear notifications for actions and errors
- **One-time Simulation**: Each user can only run the simulation once to prevent gaming the system
- **Persistent Results**: Simulation results are saved to your account

## Technical Implementation

### Backend Architecture

The game is built using Spring Boot with the following components:

1. **Controller Layer** (`userStocksTableApiController.java`)

   - Handles HTTP requests for the game
   - Key endpoints:
     - `/stocks/table/simulateStocks`: Processes the simulation request
     - `/stocks/table/getStocks`: Retrieves user's selected stocks
     - `/stocks/table/currentStockPrice`: Gets current stock prices

2. **Service Layer** (`UserStocksTableService`)

   - Manages the simulation logic
   - Integrates with Yahoo Finance API for historical stock data
   - Calculates portfolio value changes
   - Updates user balances based on simulation results

3. **Data Layer**
   - Uses JPA repositories for data persistence
   - Stores user stock selections and simulation results
   - Tracks whether a user has already completed a simulation

### Frontend Implementation

- Built with modern web technologies:
  - HTML5/CSS3 with custom styling
  - JavaScript for dynamic content
  - Responsive design for all devices
  - Real-time UI updates

## How to Play

### 1. Getting Started

1. Navigate to the Stocks Game page
2. Log in with your credentials
3. You'll see your starting balance of $10,000

### 2. Building Your Portfolio

1. **Search for Stocks**:

   - Enter a stock symbol (e.g., AAPL, MSFT, GOOGL)
   - Specify the quantity of shares you want to purchase
   - Click "Add Stock" to add it to your portfolio

2. **Managing Your Portfolio**:

   - View all selected stocks in the table
   - See the current price of each stock
   - Remove stocks by clicking the "Sell" button
   - Monitor your remaining balance

3. **Running the Simulation**:
   - When you're satisfied with your portfolio, click "Submit Stocks"
   - The system will simulate how your investments would have performed over 5 years
   - Your balance will be updated based on the simulation results
   - You can only run the simulation once

### 3. Understanding Results

- The simulation uses historical data from 5 years ago
- Your final balance represents what your $10,000 would be worth today if you had invested in those stocks 5 years ago
- The system accounts for both gains and losses based on actual market performance

## Technical Details

### Stock Price Data

- The game uses the Yahoo Finance API to fetch historical stock prices
- Prices are retrieved from 5 years ago to simulate long-term investment performance
- The API provides real market data for accurate simulation

### Simulation Algorithm

1. User selects stocks and quantities
2. System retrieves historical prices from 5 years ago
3. Calculates initial investment cost
4. Fetches current prices for the same stocks
5. Computes the value change percentage
6. Applies these changes to the user's portfolio
7. Updates the user's balance accordingly

### Security Features

- Secure user authentication
- Protected API endpoints
- Encrypted data transmission
- Prevention of multiple simulations per user

## Best Practices for the Game

### Investment Strategy

- **Diversification**: Spread your investment across different sectors
- **Research**: Choose stocks you're familiar with or have researched
- **Risk Management**: Balance between high-risk and stable investments
- **Long-term Perspective**: Focus on companies with strong fundamentals

### Game Tips

- Start with a small number of stocks to manage complexity
- Consider both tech and non-tech companies
- Include some established companies alongside growth stocks
- Monitor your remaining balance to maximize your investment

## Troubleshooting

- If a stock symbol isn't found, verify it's a valid ticker symbol
- If the simulation fails, try refreshing the page and submitting again
- For persistent issues, contact support

## Future Enhancements

- More detailed performance metrics
- Sector-based analysis
- Comparison with market indices
- Social sharing of results
- Multiple simulation attempts with different strategies
