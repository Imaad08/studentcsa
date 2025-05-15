---
layout: post
permalink: /tmas
title: The Math and Science Acadmey Opportunity
---

# Leading a Cross-Country Team to Build an Educational Platform for The Math and Science Academy  

## Overview  

Last year, I had the incredible opportunity to lead a team of 4-5 juniors and seniors from across the **US and India** to develop an educational platform for **The Math and Science Academy (MSA)**. Our mission was to create a **free, accessible website and curriculum** to teach underprivileged students **AP courses, competition-level math/science, and essential STEM knowledge**—helping bridge the educational gap for those without access to high-quality resources.  

### **Tech Stack**  
- **Next.js** (React framework) for frontend & backend  
- **Framer Motion** for engaging animations & interactivity  
- **Tailwind CSS** for responsive styling  
- **Firebase** for authentication & database (optional, if user accounts were needed)  
- **Vercel** for deployment  

---  

## **How It Started**  

### **The Opportunity**  
I was invited by **The Math and Science Academy**, a nonprofit organization dedicated to providing free STEM education, to lead a team in building a **modern, interactive learning platform**. The goal was to:  
- Offer structured **AP courses** (Calculus, Physics, Chemistry, etc.)  
- Provide training for **math/science competitions** (AMC, Olympiads, Science Bowl)  
- Include **general knowledge modules** (financial literacy, coding basics)  

### **Assembling the Team**  
Since MSA had volunteers from different time zones, I recruited:  
- **2 frontend developers** (US & India)  
- **1 curriculum designer** (India)  
- **1 content writer** (US)  
- **1 project manager** (myself, coordinating between teams)  

We used **Discord & GitHub** for collaboration, with weekly standups to track progress.  

---  

## **Development Process**  

### **1. Planning & Wireframing**  
We started with **Figma** to design:  
- A **homepage** with course categories  
- **Interactive lesson pages** (videos, quizzes, downloadable PDFs)  
- A **progress tracker** (if logged in via Firebase)  

### **2. Building the Frontend with Next.js**  
Since performance was key (many users had slower internet), we used:  
- **Static Site Generation (SSG)** for fast loading  
- **Dynamic routing** for course modules (e.g., `/courses/ap-calculus`)  
- **Responsive design** for mobile users  

```jsx
// Example of a course page structure in Next.js  
export async function getStaticPaths() {
  const courses = await getCourses(); // Fetch from CMS or JSON  
  const paths = courses.map((course) => ({
    params: { slug: course.slug },
  }));
  return { paths, fallback: false };
}
```

### **3. Adding Animations with Framer Motion**  
To make learning more engaging:  
- **Animated page transitions** between lessons  
- **Interactive quizzes** with smooth feedback  
- **Hover effects** on course cards  

```jsx
<motion.div  
  whileHover={{ scale: 1.03 }}  
  whileTap={{ scale: 0.98 }}  
  className="course-card"  
>  
  <h3>AP Calculus AB</h3>  
  <p>Master limits, derivatives, and integrals!</p>  
</motion.div>  
```

### **4. Curriculum Development**  
Our content team structured lessons into:  
1. **Video lectures** (YouTube embeds)  
2. **Practice problems** (interactive quizzes)  
3. **Downloadable worksheets** (PDFs)  
4. **Competition strategies** (AMC, Olympiad tips)  

---  

## **Challenges & Solutions**  

| **Challenge** | **Solution** |  
|--------------|------------|  
| **Time zone differences** | Scheduled overlapping work hours (early morning/late night syncs) |  
| **Content consistency** | Used a shared Notion doc for curriculum standards |  
| **Slow loading for videos** | Optimized with lazy loading & lower-resolution options |  
| **Keeping students engaged** | Added gamification (badges, progress bars) |  

---  

## **Impact & Results**  
✅ **500+ students** accessed the platform in the first month  
✅ **Used by underprivileged schools in India & US** as supplemental material  
✅ **Team collaboration improved** with GitHub Projects & Discord bots  
✅ **Laid foundation for future expansions** (live classes, mentor matching)  

---  

## **Lessons Learned**  
- **Remote teamwork requires clear communication** (document everything!)  
- **Animations improve engagement but must be performant**  
- **Static site generation (SSG) is perfect for educational content**  
- **Even simple features (like PDF downloads) make a huge difference**  

---  

## **Future Plans**  
- **Add live classes** (Zoom integration)  
- **Expand to more languages** (Hindi, Spanish)  
- **Implement Firebase for user progress tracking**  

---  

### **Final Thoughts**  
Leading this project was **one of the most rewarding experiences**—combining **tech, education, and teamwork** to make a real impact. The site is still growing, and I’m excited to see how it helps more students in the future


---  

