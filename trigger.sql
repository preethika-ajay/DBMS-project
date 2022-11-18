delimiter |

CREATE TRIGGER med_ins BEFORE INSERT ON user
  FOR EACH ROW
  BEGIN
    IF NEW.medical_insurance = 1 THEN
        INSERT INTO med_insurance SET name = NEW.name;
    END IF;

  END;
|

delimiter ;
