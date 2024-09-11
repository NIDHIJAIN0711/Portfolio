use amazon;
/*1.1. Average Price and List Price*/
	SELECT AVG(price) AS avg_price, AVG(listPrice) AS avg_list_price
	FROM products;
/*2.1. Price Distribution*/
	SELECT price, COUNT(*) AS count
	FROM products
	GROUP BY price
	ORDER BY price;
/*2.2. Rating Distribution*/
	SELECT stars, COUNT(*) AS count
	FROM products
	GROUP BY stars
	ORDER BY stars;
/*3.1. Price Discounts*/
	SELECT asin, title, price, listPrice,
	    CASE 
	        WHEN listPrice > 0 THEN (listPrice - price) / listPrice * 100
	        ELSE 0
	    END AS discount_percentage
	FROM products
	WHERE listPrice > 0;
/*4.1. Count of Best Sellers*/
	SELECT COUNT(*) AS best_sellers_count
	FROM products
	WHERE isBestSeller = 'True';
/*4.2. Best Sellers by Price*/
	SELECT asin, title, price, stars
	FROM products
	WHERE isBestSeller = 'True'
	ORDER BY price;
/*5.1. Products with No Reviews*/
	SELECT asin, title, price, stars
	FROM products
	WHERE reviews = 0;
/*5.2. Top Rated Products*/
	SELECT asin, title, price, stars
	FROM products
	ORDER BY stars DESC
	LIMIT 10;
/*6.1. Count of Products by Category*/
	SELECT category_id, COUNT(*) AS product_count
	FROM products
	GROUP BY category_id;
/*6.2. Average Price and Rating by Category */
	SELECT category_id, AVG(price) AS avg_price, AVG(stars) AS avg_rating
	FROM products
	GROUP BY category_id;
/*6.3. Best Seller Count by Category */
	SELECT category_id, COUNT(*) AS best_sellers_count
	FROM products
	WHERE isBestSeller = 'True'
	GROUP BY category_id;