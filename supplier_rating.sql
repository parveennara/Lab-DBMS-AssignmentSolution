CREATE DEFINER=`root`@`localhost` PROCEDURE `supplier_rating`()
BEGIN
	select supplier.supp_id, supplier.supp_name, rating.rat_ratstars,
	CASE
		WHEN rating.rat_ratstars>4 THEN "Genuine Supplier"
		WHEN rating.rat_ratstars>2 THEN "Average Supplier"
		ELSE "Supplier should not be considered"
	END as verdict from rating inner join supplier on rating.supp_id=supplier.supp_id;
END