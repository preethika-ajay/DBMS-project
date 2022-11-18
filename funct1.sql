DELIMITER //
CREATE PROCEDURE get_loc()
 BEGIN
  SELECT donor.organ_donated, organization.organization_name, organization.location FROM donor INNER JOIN organization ON donor.organization_id=organization.organization_id;
 END;
//
DELIMITER;
CALL get_loc()
