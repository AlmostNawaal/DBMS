create database nwl;
use nwl;	


CREATE TABLE Branch (
    BranchName VARCHAR(100) PRIMARY KEY,
    BranchCity VARCHAR(100),
    Assets DECIMAL(15,2)
);


CREATE TABLE BankCustomer (
    CustomerName VARCHAR(100) PRIMARY KEY,
    CustomerStreet VARCHAR(100),
    City VARCHAR(100)
);


CREATE TABLE BankAccount (
    AccNo INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Balance DECIMAL(15,2),
    FOREIGN KEY (BranchName) REFERENCES Branch(BranchName)
);


CREATE TABLE Depositor (
    CustomerName VARCHAR(100),
    AccNo INT,
    PRIMARY KEY (CustomerName, AccNo),
    FOREIGN KEY (CustomerName) REFERENCES BankCustomer(CustomerName),
    FOREIGN KEY (AccNo) REFERENCES BankAccount(AccNo)
);


CREATE TABLE Loan (
    LoanNumber INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Amount DECIMAL(15,2),
    FOREIGN KEY (BranchName) REFERENCES Branch(BranchName)
);


CREATE TABLE Depositer (
    CUSTOMERNAME VARCHAR(50),
    ACCNO INT,
    PRIMARY KEY (CUSTOMERNAME, ACCNO),
    FOREIGN KEY (CUSTOMERNAME) REFERENCES BankCustomer(CUSTOMERNAME),
    FOREIGN KEY (ACCNO) REFERENCES BankAccount(ACCNO)
);


INSERT INTO Branch (BranchName, BranchCity, ASSETS) VALUES
('SBI_Chamrajpet', 'Bangalore', 50000.00),
('SBI_ResidencyRoad', 'Bangalore', 10000.00),
('SBI_ShivajiRoad', 'Bombay', 20000.00),
('SBI_ParliamentRoad', 'Delhi', 10000.00),
('SBI_Jantarmantar', 'Delhi', 20000.00);

select * from Branch;

INSERT INTO BankCustomer (CustomerName, CustomerStreet, City) VALUES
('Avinash', 'Bull_Temple_Road', 'Bangalore'),
('Dinesh', 'Bannergatta_Road', 'Bangalore'),
('Mohan', 'NationalCollege_Road', 'Bangalore'),
('Nikil', 'Akbar_Road', 'Delhi'),
('Ravi', 'Prithviraj_Road', 'Delhi');

select * from BankCustomer;

INSERT INTO BankAccount (ACCNO, BRANCHNAME, BALANCE) VALUES
(1, 'SBI_Chamrajpet', 2000.00),
(2, 'SBI_ResidencyRoad', 5000.00),
(3, 'SBI_ShivajiRoad', 6000.00),
(4, 'SBI_ParliamentRoad', 9000.00),
(5, 'SBI_Jantarmantar', 8000.00),
(6, 'SBI_ShivajiRoad', 4000.00),
(8, 'SBI_ResidencyRoad', 4000.00),
(9, 'SBI_ParliamentRoad', 3000.00),
(10, 'SBI_ResidencyRoad', 5000.00),
(11, 'SBI_Jantarmantar', 2000.00);

select * from BankAccount;

INSERT INTO Loan (LOANNUMBER, BRANCHNAME, AMOUNT) VALUES
(1, 'SBI_Chamrajpet', 1000.00),
(2, 'SBI_ResidencyRoad', 2000.00),
(3, 'SBI_ShivajiRoad', 3000.00),
(4, 'SBI_ParliamentRoad', 4000.00),
(5, 'SBI_Jantarmantar', 5000.00);

select * from Loan;

INSERT INTO Depositer (CustomerName, AccNo) VALUES
('Avinash', 1),
('Dinesh', 2),
('Nikil', 4),
('Ravi', 5),
('Avinash', 8),
('Nikil', 9),
('Dinesh', 10),
('Nikil', 11);

select * from Depositer;

SELECT
    Depositer.CustomerName
FROM
    Depositer, BankAccount
WHERE
    Depositer.AccNo = BankAccount.ACCNO 
GROUP BY
    Depositer.CustomerName, BankAccount.BRANCHNAME
HAVING
    COUNT(Depositer.AccNo) >= 2;


CREATE VIEW Branch_Loan_Summary AS
SELECT
    BRANCHNAME,
    SUM(AMOUNT) AS Total_Loan_Amount
FROM
    Loan
GROUP BY
    BRANCHNAME;
    
SELECT * FROM Branch_Loan_Summary;
