start transaction;
use `Acme-Recycling`;
revoke all privileges on `Acme-Recycling`.* from 'acme-user'@'%';
revoke all privileges on `Acme-Recycling`.* from 'acme-manager'@'%';
drop user 'acme-user'@'%';
drop user 'acme-manager'@'%';
drop database `Acme-Recycling`;
commit;