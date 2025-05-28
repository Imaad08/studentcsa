---
toc: True
comments: True
layout: post
title: Graph Heuristics
description: Graph heuristics are simple strategies used to solve graph problems quickly when finding an exact solution is too slow. These methods help in tasks like finding paths, organizing networks, and making decisions in graphs.
courses: {'csa': {'week': 25}}
type: ccc
permalink: /graph
---

# Graph Heuristics: An Introduction

## What Are Graph Heuristics?

Graph heuristics are simple, fast strategies used to solve complex graph problems when finding the perfect solution would take too much time or computational resources. Think of them as "educated guesses" that help us make good decisions quickly in network-based problems.

These methods are particularly valuable in real-world applications like GPS navigation, network routing, game AI, and resource allocation, where getting a reasonably good answer fast is more important than finding the theoretically perfect solution.

## Key Terminology

**Heuristic**: An estimation or "rule of thumb" that guides decision-making without guaranteeing the optimal result. In graph problems, heuristics estimate the cost or distance to reach a goal.

**Exact Algorithm**: A method that guarantees finding the optimal (best possible) solution, but may require significant time and computational resources.

**Approximation**: A solution that is "good enough" - close to optimal but not necessarily perfect.

**Cost Function**: A way to measure how expensive or difficult it is to move from one node to another in a graph.

**Admissible Heuristic**: A heuristic that never overestimates the actual cost to reach the goal, ensuring that algorithms using it will find optimal solutions.

## The Trade-off: Speed vs. Perfection

Traditional algorithms like Dijkstra's algorithm systematically explore all possible paths to guarantee the best solution. However, this thoroughness comes at a cost - they can be slow on large graphs because they don't use any estimation or intuition about where the goal might be.

Graph heuristics change this equation by introducing **estimation** into the search process. Instead of blindly exploring every possibility, they make educated guesses about which directions are most promising, allowing them to find good solutions much faster.

The fundamental principle: **Heuristic = Estimation**. This estimation guides the algorithm toward promising areas of the graph while avoiding less likely paths.

## Greedy Best First Search

### So What is Greedy Best-First Search

Greedy Best-First Search (or Greedy BFS) is a graph algorithm that only looks ahead. It tries to get to the goal as fast as possible by always going to the node that looks closest to the goal—but it only uses the estimate (the heuristic), not the actual cost it took to get there.

### Example

Imagine you're trying to drive to a city far away. You ahve to open your map and just start going toward the city that looks the closest to your destination (The Straight Line Distance) even if it takes you through mountains.

That's what greedy BFS does. It trusts the estimate blindly

### How It Works
	1.	You start at a node.
	2.	Look at all neighboring nodes.
	3.	Choose the one with the lowest estimated distance to the goal (the smallest heuristic).
	4.	Repeat until you find the goal.

### Example Continued


| City | Straight-Line Distance to Goal (G) |
|------|-----------------------------------|
| A    | 10                                |
| B    | 5                                 |
| C    | 3                                 |
| G    | 0                                 |

If you're at city A and your neighbors are B and C:
- C has h(n) = 3
- B has h(n) = 5
- You would choose C since 3 < 5

This is "greedy" because it only looks at the heuristic value (straight-line distance) and picks the smallest one, without considering the actual path cost to get there.

The algorithm might not always find the shortest path, but it usually finds a reasonable path quickly.


### Java Implementation

Here's how we can implement Greedy Best-First Search in Java:



```python
// Priority queue selects nodes with the smallest heuristic value first
PriorityQueue<Node> open = new PriorityQueue<>(Comparator.comparingInt(n -> n.heuristic));
Set<Node> visited = new HashSet<>();

open.add(start); // Add the start node to the queue

while (!open.isEmpty()) {
    Node current = open.poll(); // Take the node with the lowest h(n)
    
    if (current == goal) break; // If we've reached the goal, stop

    visited.add(current); // Mark current node as visited

    // Look at all neighboring nodes
    for (Edge edge : current.neighbors) {
        if (!visited.contains(edge.target)) {
            open.add(edge.target); // Add unvisited neighbor to the queue
        }
    }
}
```

### PROS AND CONS

#### Pros:
- Very fast
- Simple to code 
- Good for huge graphs when speed matters more than accuracy

#### Cons:
- Not guaranteed to find the shortest path
- Can get tricked by a bad heuristic
- Doesn't account for how far you've already traveled

# Uniform‑Cost Search: Dijkstra’s Algorithm

> **Also called:** Uniform‑Cost Search, Shortest Path Algorithm  
> **Use case:** Finding shortest paths in a **weighted** graph with non‑negative edge weights  

**Weighted** graph

<img width="933" alt="Image" src="https://github.com/user-attachments/assets/dba80ae1-45b4-4ab8-915d-7d8b40466da7" />

(vertices = towns, edges = roads)

1. updates estimates
2. chooses next vertex
    - (always chooses shortest known)

---

## Key Concepts

- **g(n)** – the cost from the start node to node n  
- Always expands the frontier node with the smallest g(n)  
- Guarantees optimal shortest paths when all edge weights ≥ 0  

---

## Pseudocode

```plaintext
function Dijkstra(start):
    // Initialization
    for each node u in Graph:
        dist[u] ← ∞
        prev[u] ← null
    dist[start] ← 0

    // Min‑priority queue ordered by dist[]
    Q ← all nodes in Graph

    while Q not empty:
        u ← extract_min(Q)            // node with smallest dist[u]
        for each neighbor v of u:
            alt ← dist[u] + cost(u, v)
            if alt < dist[v]:
                dist[v] ← alt
                prev[v] ← u
                decrease_key(Q, v, alt)
    return dist, prev
```

## Path Reconstruction

```plaintext
function reconstruct_path(prev, start, target):
    path ← []
    u ← target
    while u ≠ null:
        path.prepend(u)
        u ← prev[u]
    return path

```

## Example
```plaintext

   (A)
  /   \
5/     \1
/       \
(B) —2— (C)

```
1. Initialization
- dist[A]=0, dist[B]=∞, dist[C]=∞

2. Extract A (cost 0), update:
- B via A: alt=0+5→dist[B]=5
- C via A: alt=0+1→dist[C]=1

3. Extract C (cost 1), update B:
- B via C: alt=1+2=3 < 5→dist[B]=3, prev[B]=C

# The A* Algorithm: Smart Pathfinding

## What is A*?

The A* (pronounced "A-star") algorithm is one of the most popular and effective pathfinding algorithms in computer science. It combines the best features of Dijkstra's algorithm (guaranteeing optimal solutions) with the speed benefits of heuristic search.

A* works by maintaining two key pieces of information for each node:
- **g(n)**: The actual cost to reach node n from the start
- **h(n)**: The estimated cost to reach the goal from node n (the heuristic)

The algorithm uses **f(n) = g(n) + h(n)** to decide which node to explore next, always choosing the node with the lowest f-score.

## How A* Works: Step by Step

1. **Start** with the initial node and add it to an "open list"
2. **Evaluate** each node using f(n) = g(n) + h(n)
3. **Choose** the node with the lowest f-score from the open list
4. **Explore** its neighbors and update their costs
5. **Repeat** until you reach the goal or exhaust all possibilities

## A* vs. Other Algorithms

| Algorithm | Speed | Optimality | Uses Heuristic |
|-----------|-------|------------|----------------|
| Dijkstra's | Slow | ✓ Optimal | ✗ No |
| Greedy Best-First | Fast | ✗ Not guaranteed | ✓ Yes |
| A* | Moderate | ✓ Optimal* | ✓ Yes |

*A* is optimal when using an admissible heuristic (one that never overestimates)

## Simple Java Implementation


```python
import java.util.*;

public class AStar {
    
    // Node class to represent each node in the graph
    static class Node implements Comparable<Node> {
        String name;
        double gScore;  // Actual cost from start
        double fScore;  // g + heuristic
        Node parent;    // For path reconstruction
        
        public Node(String name) {
            this.name = name;
            this.gScore = Double.MAX_VALUE;
            this.fScore = Double.MAX_VALUE;
            this.parent = null;
        }
        
        @Override
        public int compareTo(Node other) {
            return Double.compare(this.fScore, other.fScore);
        }
        
        @Override
        public boolean equals(Object obj) {
            if (this == obj) return true;
            if (obj == null || getClass() != obj.getClass()) return false;
            Node node = (Node) obj;
            return name.equals(node.name);
        }
        
        @Override
        public int hashCode() {
            return name.hashCode();
        }
    }
    
    // Edge class to represent connections between nodes
    static class Edge {
        String to;
        double cost;
        
        public Edge(String to, double cost) {
            this.to = to;
            this.cost = cost;
        }
    }
    
    /**
     * A* pathfinding algorithm
     * @param graph Map of node names to their edges
     * @param heuristic Map of node names to their heuristic values
     * @param start Starting node name
     * @param goal Goal node name
     * @return List of node names representing the path, or empty list if no path
     */
    public static List<String> findPath(Map<String, List<Edge>> graph, 
                                       Map<String, Double> heuristic,
                                       String start, String goal) {
        
        // Priority queue for open nodes (to be explored)
        PriorityQueue<Node> openSet = new PriorityQueue<>();
        
        // Set of explored nodes
        Set<String> closedSet = new HashSet<>();
        
        // Map to quickly find nodes by name
        Map<String, Node> allNodes = new HashMap<>();
        
        // Initialize start node
        Node startNode = new Node(start);
        startNode.gScore = 0;
        startNode.fScore = heuristic.getOrDefault(start, 0.0);
        
        openSet.add(startNode);
        allNodes.put(start, startNode);
        
        while (!openSet.isEmpty()) {
            // Get node with lowest f-score
            Node current = openSet.poll();
            
            // Check if we reached the goal
            if (current.name.equals(goal)) {
                return reconstructPath(current);
            }
            
            closedSet.add(current.name);
            
            // Explore neighbors
            List<Edge> neighbors = graph.getOrDefault(current.name, new ArrayList<>());
            for (Edge edge : neighbors) {
                if (closedSet.contains(edge.to)) {
                    continue; // Skip already explored nodes
                }
                
                // Get or create neighbor node
                Node neighbor = allNodes.getOrDefault(edge.to, new Node(edge.to));
                if (!allNodes.containsKey(edge.to)) {
                    allNodes.put(edge.to, neighbor);
                }
                
                // Calculate tentative g-score
                double tentativeG = current.gScore + edge.cost;
                
                // If this is a better path to the neighbor
                if (tentativeG < neighbor.gScore) {
                    neighbor.parent = current;
                    neighbor.gScore = tentativeG;
                    neighbor.fScore = tentativeG + heuristic.getOrDefault(edge.to, 0.0);
                    
                    // Add to open set if not already there
                    if (!openSet.contains(neighbor)) {
                        openSet.add(neighbor);
                    }
                }
            }
        }
        
        return new ArrayList<>(); // No path found
    }
    
    /**
     * Reconstruct the path from goal to start
     */
    private static List<String> reconstructPath(Node goalNode) {
        List<String> path = new ArrayList<>();
        Node current = goalNode;
        
        while (current != null) {
            path.add(current.name);
            current = current.parent;
        }
        
        Collections.reverse(path);
        return path;
    }
    
    // Example usage
    public static void main(String[] args) {
        // Create a simple graph: A -> B -> D (goal)
        //                        A -> C -> D
        Map<String, List<Edge>> graph = new HashMap<>();
        
        graph.put("A", Arrays.asList(
            new Edge("B", 4),
            new Edge("C", 2)
        ));
        graph.put("B", Arrays.asList(new Edge("D", 3)));
        graph.put("C", Arrays.asList(new Edge("D", 6)));
        graph.put("D", new ArrayList<>());
        
        // Heuristic values (estimated distance to goal D)
        Map<String, Double> heuristic = new HashMap<>();
        heuristic.put("A", 5.0);
        heuristic.put("B", 2.0);
        heuristic.put("C", 4.0);
        heuristic.put("D", 0.0);
        
        // Find path from A to D
        List<String> path = findPath(graph, heuristic, "A", "D");
        
        System.out.println("Optimal path: " + String.join(" -> ", path));
        System.out.println("Total cost: 7 (A -> B: 4, B -> D: 3)");
    }
}
```

## Key Points to Remember

1. **A* is optimal** when using an admissible heuristic (never overestimates)
2. **Faster than Dijkstra's** because it uses heuristic guidance
3. **More reliable than Greedy** because it considers actual costs
4. **The heuristic matters** - better heuristics lead to faster searches
5. **Memory usage** can be high for large graphs (stores many nodes)

## When to Use A*

**Best for:**
- Pathfinding in games and robotics
- GPS navigation systems
- Network routing with known destinations
- Puzzle solving (like sliding puzzles)

**Consider alternatives when:**
- Memory is extremely limited
- You need to find paths to multiple goals
- The heuristic is hard to calculate or unreliable

## Homework

### 1. Short Problem

**Problem:**  
Consider the following graph and heuristic values toward goal `D`:

```plaintext
      (A)
     /   \
   2/     \4
   /       \
 (B) —3— (C)
   \       /
   5\     /1
     \   /
      (D)

```


- Edge weights:  
  - A–B = 2  
  - A–C = 4  
  - B–C = 3  
  - B–D = 5  
  - C–D = 1  

- Heuristic estimates _h(n)_ (straight‑line distance to D):  
  - h(A) = 6  
  - h(B) = 4  
  - h(C) = 2  
  - h(D) = 0  

**Task:**  
Run the A\* algorithm from **A** to **D**, showing for each step:

1. Which node you select next (lowest _f = g + h_).
2. The values of _g(n)_, _h(n)_, and _f(n)_ for each neighbor when you relax its edges.
3. The final shortest path and its total cost.

```java
import java.util.*;

public class AStarGraph {
    static class Node {
        String name;
        int g, h; // g = cost from start, h = heuristic
        Node parent;

        Node(String name, int h) {
            this.name = name;
            this.h = h;
            this.g = Integer.MAX_VALUE;
            this.parent = null;
        }

        int f() {
            return g + h;
        }
    }

    static class Edge {
        Node to;
        int cost;

        Edge(Node to, int cost) {
            this.to = to;
            this.cost = cost;
        }
    }

    public static void main(String[] args) {
        // define nodes with heuristic values
        Node A = new Node("A", 6);
        Node B = new Node("B", 4);
        Node C = new Node("C", 2);
        Node D = new Node("D", 0);

        // build the graph
        Map<Node, List<Edge>> graph = new HashMap<>();
        graph.put(A, Arrays.asList(new Edge(B, 2), new Edge(C, 4)));
        graph.put(B, Arrays.asList(new Edge(C, 3), new Edge(D, 5)));
        graph.put(C, Arrays.asList(new Edge(D, 1)));
        graph.put(D, new ArrayList<>()); // goal node

        // a* starts here
        A.g = 0;
        PriorityQueue<Node> open = new PriorityQueue<>(Comparator.comparingInt(Node::f));
        Set<Node> closed = new HashSet<>();
        open.add(A);

        while (!open.isEmpty()) {
            Node current = open.poll();
            if (current == D) break;

            closed.add(current);
            System.out.println("selected: " + current.name);

            for (Edge edge : graph.get(current)) {
                Node neighbor = edge.to;
                if (closed.contains(neighbor)) continue;

                int tentativeG = current.g + edge.cost;

                if (tentativeG < neighbor.g) {
                    neighbor.g = tentativeG;
                    neighbor.parent = current;

                    System.out.println("  neighbor: " + neighbor.name +
                        "  g: " + neighbor.g +
                        "  h: " + neighbor.h +
                        "  f: " + neighbor.f());

                    if (!open.contains(neighbor)) {
                        open.add(neighbor);
                    }
                }
            }
        }

        // build final path
        List<String> path = new ArrayList<>();
        Node step = D;
        int totalCost = D.g;
        while (step != null) {
            path.add(0, step.name);
            step = step.parent;
        }

        System.out.println("path: " + String.join(" -> ", path));
        System.out.println("total cost: " + totalCost);
    }
}
```

---

### 2. Multiple‑Choice Questions

1. **Which property of a heuristic _h(n)_ guarantees that A\* will find the optimal path?**  
   ## B. Admissibility  

2. **Greedy Best‑First Search selects which node to expand next?**  
   ## B. The node with the smallest _h(n)_ (estimated cost to goal)  

3. **On a 4‑connected grid (no diagonal moves), which of these is an admissible heuristic for pathfinding?**  
   ## B. Manhattan distance  

4. **Which of the following is a drawback of Greedy Best‑First Search compared to A\*?**  
   ## B. It may expand nodes in non‑optimal order and fail to find the shortest path  
