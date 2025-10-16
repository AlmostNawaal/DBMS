SELECT DISTINCT S.CustomerName
FROM Depositer AS S
WHERE NOT EXISTS (
    SELECT BranchName
    FROM Branch
    WHERE BranchCity = 'Delhi'
    EXCEPT
    SELECT B.BranchName
    FROM Depositer AS D
    JOIN BankAccount AS B ON D.AccNo = B.AccNo
    WHERE D.CustomerName = S.CustomerName
);

select BranchName from branch where ASSETS> all(select ASSETS from branch where BranchCity = "Bangalore"); 

update BankAccount set balance = balance*1.05;

select * from BankAccount;