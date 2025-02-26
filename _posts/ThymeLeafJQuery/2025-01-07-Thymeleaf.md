---
layout: post
toc: True
title: Thymeleaf
description: Introduction to Thymeleaf Template Engine
categories: ['CSA-PBL']
courses: {'csa': {'week': 18}}
type: ccc
menu: nav/FRQ_teach/jquery-thymeleafp3.html
author: Akhil, Tarun, Kayden
permalink: /period3/thymeleaf
---

# Navigation
- [Thymeleaf]({{site.baseurl}}/period3/thymeleaf)
- [Jquery]({{site.baseurl}}/period3/jquery)
- [HW]({{site.baseurl}}/period3/jquery-thymeleaf-homework)

# Thymeleaf Review

### What is Thymeleaf?
- Server-side Java template engine
- Natural templating - templates can be viewed as static prototypes
- Integrates seamlessly with Spring Boot

### How is it useful?

- Saves you a bunch of valuable time
- Allows you to do much shorter lines/files that are simpler and complete the same tasks

**Basic Syntax:**
1. Namespace Declaration
```html
<html xmlns:th="http://www.thymeleaf.org">
```

2. Standard Expression Types
```html
<!-- Variable Expression -->
<p th:text="${variable}">Placeholder text</p>

<!-- Selection Expression -->
<p th:text="*{property}">Placeholder text</p>

<!-- Link Expression -->
<a th:href="@{/path}">Link text</a>

<!-- Message Expression -->
<p th:text="#{message.key}">Welcome message</p>
```

### Key Features
- Layout dialects for template inheritance
- Fragment inclusion
- Conditional rendering
- Form handling
- Internationalization support

# Basic Operations

### Form Handling
```html
<form th:action="@{/save}" th:object="${user}" method="post">
    <input type="text" th:field="*{name}"/>
    <input type="email" th:field="*{email}"/>
    <button type="submit">Submit</button>
</form>
```

### Iteration
```html
<ul>
    <li th:each="item : ${items}" th:text="${item.name}">Item name</li>
</ul>
```

### Conditionals
```html
<div th:if="${not #lists.isEmpty(items)}">
    <!-- Content shown if items is not empty -->
</div>

<div th:switch="${user.role}">
    <p th:case="'admin'">User is an administrator</p>
    <p th:case="'manager'">User is a manager</p>
    <p th:case="*">User is some other role</p>
</div>
```

### Fragment Inclusion
```html
<!-- Define fragment -->
<footer th:fragment="footer">
    <p>Common footer content</p>
</footer>

<!-- Use fragment -->
<div th:replace="~{fragments/footer :: footer}"></div>
```

## Mr. Mortensen's Example
<body>
  <!-- <body> -->
  <div layout:fragment="body" th:remove="tag">
      <!-- Page specific body additions -->
      <div class="contact" style="height: 35vh;">
          <div class="row justify-content-left" style="margin: 2%;">
              <form th:action="@{/greet}" method="GET" id="greetForm">
                  <div>
                      <label for="greetField">Type a greeting name?</label>
                      <input name="name" id="greetField">
                      <button>Greetings!</button>
                      <p id="greetMessage" th:text="'Greetings, ' + ${name} + '!'"></p>
                  </div>
              </form>
          </div>
      </div>
  </div>
</body>

## Example Task

Create a Thymeleaf template that displays a list of products with their prices. Include a conditional to show a "Sale!" message if the price is below $50.

### Example Solution:
```html
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Our Products</h1>
    
    <div th:if="${#lists.isEmpty(products)}">
        <p>No products available</p>
    </div>
    
    <div th:unless="${#lists.isEmpty(products)}">
        <ul>
            <li th:each="product : ${products}">
                <span th:text="${product.name}">Product Name</span>
                <span th:text="${'$' + #numbers.formatDecimal(product.price, 1, 2)}">$0.00</span>
                <span th:if="${product.price < 50}" class="sale-badge">Sale!</span>
            </li>
        </ul>
    </div>
</body>
</html>
```

### Corresponding Controller:
```java
@Controller
public class ProductController {
    
    @GetMapping("/products")
    public String showProducts(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "products";
    }
}
```

# Checklist to Maximize Success ✅

**Before Writing Templates**
- Ensure proper namespace declaration
- Understand the model attributes being passed from controller
- Plan layout structure and reusable fragments

**Writing Templates**
- Use correct expression syntax (${}, @{}, *{}, #{})
- Handle null values appropriately
- Implement proper error handling
- Use th:with for complex expressions


# Common Mistakes to Avoid ❌

### Expression Syntax Confusion
${...} vs *{...}:
- ${...}: Variable expressions (context variables)
- *{...}: Selection expressions (selected object)

```html
<!-- Wrong -->
<form th:object="${user}">
    <input th:value="${name}"/>  <!-- Incorrect -->
</form>

<!-- Correct -->
<form th:object="${user}">
    <input th:value="*{name}"/>  <!-- Correct -->
</form>
```

### Link URL Construction
- Always use @{...} for URLs
- Remember context path handling

```html
<!-- Wrong -->
<a href="/user/profile">Profile</a>

<!-- Correct -->
<a th:href="@{/user/profile}">Profile</a>
```

### Fragment Inclusion
- Proper syntax for fragment references
- Correct parameter passing

```html
<!-- Wrong -->
<div th:include="footer">...</div>

<!-- Correct -->
<div th:replace="~{fragments/footer :: footer}">...</div>
```

### Common Runtime Errors
- Not handling null values
- Incorrect iteration variable scope
- Missing model attributes
- Invalid expression syntax
