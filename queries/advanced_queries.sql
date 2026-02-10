-- Q1: What percentage of total revenue does each pizza category contribute?

SELECT 
    pizza_types.category,
    CONCAT(ROUND(SUM(order_details.quantity * pizzas.price) / (SELECT 
                            SUM(order_details.quantity * pizzas.price)
                        FROM
                            pizzas
                                JOIN
                            order_details ON order_details.pizza_id = pizzas.pizza_id) * 100,
                    2),
            '%') AS revenue_percentage
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage;

-- Q2: Analyze cumulative revenue generated over time
SELECT 
    orders.order_date,
    ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue,
    ROUND(
        SUM(SUM(order_details.quantity * pizzas.price))
        OVER (ORDER BY orders.order_date),
        2
    ) AS cumulative_revenue
FROM orders
JOIN order_details
    ON orders.order_id = order_details.order_id
JOIN pizzas
    ON pizzas.pizza_id = order_details.pizza_id
GROUP BY orders.order_date;

-- Q3: Top 3 pizza types by revenue within each category
SELECT *
FROM (
    SELECT 
        category,
        name,
        revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS rnk
    FROM (
        SELECT 
            pizza_types.category,
            pizza_types.name,
            SUM(order_details.quantity * pizzas.price) AS revenue
        FROM order_details
        JOIN pizzas
            ON order_details.pizza_id = pizzas.pizza_id
        JOIN pizza_types
            ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        GROUP BY pizza_types.category, pizza_types.name
    ) AS t
) ranked
WHERE rnk <= 3;
