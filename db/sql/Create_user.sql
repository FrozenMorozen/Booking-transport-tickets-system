-- Create the user 
create user developer
  identified by "developer"
  profile DEFAULT;
-- Grant/Revoke role privileges 
grant resource to developer with admin option;
grant connect to developer with admin option;
