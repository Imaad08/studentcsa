---
layout: page
title: About
permalink: /about/
---

<style>
  body {
    background-color: #1a1a1a; /* Dark background */
    color: white; /* White font */
    font-family: 'Helvetica Neue', sans-serif;
    margin: 0;
    padding: 0;
  }
  .image-gallery {
      display: flex;
      flex-wrap: nowrap;
      overflow-x: auto;
      gap: 10px;
  }

  .image-gallery img {
      max-height: 300px;
      object-fit: cover;
      border-radius: 5px;
  }

  .section {
    background-color: #282828;
    padding-bottom: 10px; /* Minimal padding */
    padding-right: 10px; 
    padding-left: 10px; 
    margin: 15px;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 128, 255, 0.4); /* Faint blue shadow */
    animation: pulse 2.5s infinite; /* Constant pulsing animation */
  }

  h1, h2, h3, p {
    margin: 5px 0; /* Reduced margin to bring text closer to the top */
    padding: 10px; /* No padding */
    line-height: 1.2; /* Reduced line-height for tighter text */
    text-align: center;
  }

  /* Animation for the box shadow */
  @keyframes pulse {
    0% {
      box-shadow: 0 0 20px rgba(0, 128, 255, 0.4);
    }
    50% {
      box-shadow: 0 0 30px rgba(0, 128, 255, 0.6);
    }
    100% {
      box-shadow: 0 0 20px rgba(0, 128, 255, 0.4);
    }
  }

  /* Grid styling */
  .grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Flag, arrow, flag layout */
    gap: 10px;
    padding: 0; /* Remove extra padding */
  }

  .grid-item {
    text-align: center;
  }

  .grid-item img {
    width: 250px; /* Increased flag size */
    height: auto;
    border-radius: 10px;
    transition: box-shadow 0.3s ease; /* Smooth transition for hover effect */
    justify-content: center;
    align-items: center;
    margin-left: 120px;
  }

  /* Glow effect on hover */
  .grid-item img:hover {
    box-shadow: 0 0 30px rgba(0, 128, 255, 0.6); /* Glow effect on hover */
  }

  /* Arrow styling */
  .arrow img {
    width: 250px; /* Adjust arrow size to match flags */
    height: auto;
    margin-top: 30px; /* Fine-tune arrow positioning */
  }

  /* Center the India flag */
  .india-flag {
    display: flex;
    justify-content: center; /* Center horizontally */
    margin-top: 20px; /* Add some space above */
  }

  .india-flag img {
    width: 250px; /* Adjust flag size */
    height: auto;
    border-radius: 10px;
    transition: box-shadow 0.3s ease; /* Smooth transition for hover effect */
  }

  .india-flag img:hover {
    box-shadow: 0 0 30px rgba(0, 128, 255, 0.6); /* Glow effect on hover */
  }
</style>

<div class="section">
  <h1>About Me Page</h1>
</div>

# Pictures about me

<div class="image-gallery">
  <img src="{{site.baseurl}}/images/image-15.png" alt="image1"> 
  <img src="{{site.baseurl}}/images/IMG_8246.JPG" alt="image2"> 
  <img src="{{site.baseurl}}/images/SCR-20240908-udud.jpeg" alt="image3"> 
  <img src="{{site.baseurl}}/images/SCR-20240908-udzs.jpeg" alt="image4"> 
  <img src="{{site.baseurl}}/images/SCR-20240908-udny.jpeg" alt="image5"> 
</div>

<div class="section">
  <h2>About Me</h2>
  <p>
    My name is Imaad Muzaffer and I am a passionate coder who loves working his way around problems. I belive that you have to approach coding with a curious and embracing mindset. I enjoy embracing coding problems because each time I encounter a problem, I see it as a way to broaden my coding skillset and become a better coder in general. Another thing I love about coding, web development, specifically, is when you pour a lot of hard work into a website and it turns out looking exactly how you want. Frienship is also something I hold extremely close to me as I love being around my friends and laughing with them. This feeling makes me feel happy and brings a smile to my face.
  </p>
</div>
<div class="section">
  <h2>Where I come from</h2>
  <p>
    I was born in San Diego but my family is originally from India
  </p>

  <div class="grid-container">
    <div class="grid-item">
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Flag_of_San_Diego_Goverment_Variant.svg/1600px-Flag_of_San_Diego_Goverment_Variant.svg.png" alt="SD">
      <p>            Born in SD</p>
    </div>
    <div class="grid-item">
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_India.svg/1599px-Flag_of_India.svg.png" alt="Ind">
      <p>            From India</p>
    </div>
  </div>

</div>

<div class="section">
  <h2>My Class Schedule</h2>
  <table>
    <tr>
      <th>Period</th>
      <th>Class</th>
    </tr>
    <tr>
      <td>1</td>
      <td>AP CSA</td>
    </tr>
    <tr>
      <td>2</td>
      <td>AP Physics</td>
    </tr>
    <tr>
      <td>3</td>
      <td>PE</td>
    </tr>   
    <tr>
      <td>4</td>
      <td>AP Bio</td>
    </tr>
    <tr>
      <td>5</td>
      <td>American Literature</td>
    </tr>
  </table>
</div>

<div class="section">
  <h2>My Freeform Picture</h2>
  <div class="freeform-picture">
    <img src="{{site.baseurl}}/images/image-14.png" alt="Freeform Picture">
  </div>
  <p>This is the freeform picture that I created</p>
</div>
