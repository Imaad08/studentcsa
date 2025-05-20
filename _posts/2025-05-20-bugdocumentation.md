---
layout: post
permalink: /bugdocs
title: Project Bug Docs
---

# **Bug Documentation & Fixes: Stock Market Simulator Game**  

**Project:** Stock Market Simulator (Java + Processing UI + Firebase)  
**Role:** Lead Developer & UI/Responsiveness Fixes  
**Bug Types:** Mostly Frontend (UI/UX), Minor API Handling  

---  

## **Bug #1: Leaderboard Overflow on Mobile Devices**  
**Reported By:** Beta Tester (iPhone 12)  
**Issue:** The leaderboard table **extends beyond screen width**, forcing horizontal scrolling.  

### **Root Cause:**  
- Fixed-width columns (`width: 300px`) in the leaderboard UI.  
- No mobile-responsive breakpoints.  

### **Fix Implemented:**  
```java
// Before (static width)  
leaderboardTable.setColumnWidth(0, 300);  

// After (dynamic scaling)  
if (isMobile()) {  
  leaderboardTable.setColumnWidth(0, width * 0.8); // 80% of screen  
} else {  
  leaderboardTable.setColumnWidth(0, 300);  
}  
```  
**Result:**  
✅ No more horizontal scrolling on mobile.  
✅ Columns now scale dynamically.  

---  

## **Bug #2: Stock Price Chart Misaligned on Small Screens**  
**Reported By:** User (iPad Mini)  
**Issue:** The **stock price graph** clips outside its container on screens < 1024px.  

### **Root Cause:**  
- Hardcoded `width=800, height=400` for the chart.  
- No viewport adjustment logic.  

### **Fix Implemented:**  
```java
// Dynamic chart sizing  
void setupChart() {  
  float chartW = (width < 1000) ? width * 0.9 : 800;  
  float chartH = (height < 500) ? height * 0.6 : 400;  
  stockChart = new Chart(this, chartW, chartH);  
}  
```  
**Result:**  
✅ Graph now resizes proportionally.  
✅ No more clipping on tablets/mobile.  

---  

## **Bug #3: Button Text Clipping in Non-English Languages**  
**Reported By:** Spanish Localization Tester  
**Issue:** Long translations (e.g., "COMPRAR AHORA") **get cut off** in buttons.  

### **Root Cause:**  
- Fixed button padding (`padding: 8px 12px`).  
- No `text-overflow` handling.  

### **Fix Implemented:**  
```java
// Before  
drawButton("Buy Now", x, y, 100, 40);  

// After  
drawButton("Comprar Ahora", x, y, textWidth("Comprar Ahora") + 20, 40);  
```  
**Result:**  
✅ Buttons now **expand dynamically** with text.  
✅ Supports all languages without clipping.  

---  

## **Bug #4: Firebase Data Flicker on Slow Connections**  
**Reported By:** User (Low Network Speed)  
**Issue:** Leaderboard **blinks "Loading..."** multiple times before stabilizing.  

### **Root Cause:**  
- No **loading state cache**—UI re-rendered on every Firebase snapshot.  

### **Fix Implemented:**  
```java
// Added a 1-sec delay before showing "Loading..."  
if (firebase.isLoading() && lastUpdateTime > 1000) {  
  drawLoadingSpinner();  
} else {  
  drawLeaderboard();  
}  
```  
**Result:**  
✅ Smoother transitions.  
✅ No more rapid flickering.  

---  

## **Bug #5: Dark Mode Toggle Inconsistency**  
**Reported By:** Multiple Users  
**Issue:** Toggling dark mode **doesn’t update charts/buttons** instantly.  

### **Root Cause:**  
- Only the **background color** was toggling.  
- Chart/text colors remained static.  

### **Fix Implemented:**  
```java
void applyDarkMode() {  
  background = darkMode ? #121212 : #FFFFFF;  
  chart.setLineColor(darkMode ? #FFFFFF : #000000);  
  buttons.setTextColor(darkMode ? #EEEEEE : #333333);  
}  
```  
**Result:**  
✅ Full UI now responds to dark mode.  
✅ No manual refreshes needed.  

---  

## **Lessons Learned from These Fixes**  
1. **Always Test on Real Devices** – Emulators miss viewport quirks.  
2. **Assume Text Will Expand** – Design for the longest possible strings.  
3. **Loading States Matter** – Never let the UI "blink" uncontrollably.  
4. **Dark Mode is All-or-Nothing** – Inconsistent theming breaks immersion.  

---  

### **Future UI/UX Improvements Backlog**  
- [ ] **Swipe gestures** for mobile users.  
- [ ] **High-contrast mode** for accessibility.  
- [ ] **Animated transitions** between stock views.  

---  

