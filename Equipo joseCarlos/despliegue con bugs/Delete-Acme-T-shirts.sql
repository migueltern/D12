start transaction;
use `Acme-T-shirts`;
revoke all privileges on `Acme-T-shirts`.* from 'acme-user'@'%';
revoke all privileges on `Acme-T-shirts`.* from 'acme-manager'@'%';
drop user 'acme-user'@'%';
drop user 'acme-manager'@'%';
drop database `Acme-T-shirts`;
commit;