USE bank;

INSERT INTO bank.account_type (name) values('Savings');
INSERT INTO bank.account_type (name) values('Fixed Deposit');
INSERT INTO bank.account_type (name) values('Recurring Deposit');
INSERT INTO bank.account_type (name) values('Gold Loan');
INSERT INTO bank.account_type (name) values('Home Loan');

INSERT INTO bank.account_status_type (name) values('Active');
INSERT INTO bank.account_status_type (name) values('Passive');
INSERT INTO bank.account_status_type (name) values('Closed');
INSERT INTO bank.account_status_type (name) values('Dormant');

INSERT INTO bank.operation_mode (name) values('Self');
INSERT INTO bank.operation_mode (name) values('Joint');

INSERT INTO bank.transaction_type (name) values('Debit');
INSERT INTO bank.transaction_type (name) values('Credit');

INSERT INTO bank.transaction_mode (transactionTypeId, name) values(1, 'Cash');
INSERT INTO bank.transaction_mode (transactionTypeId, name) values(1, 'Cheque');
INSERT INTO bank.transaction_mode (transactionTypeId, name) values(1, 'UPI');
INSERT INTO bank.transaction_mode (transactionTypeId, name) values(1, 'NEFT');
INSERT INTO bank.transaction_mode (transactionTypeId, name) values(1, 'ATM');
INSERT INTO bank.transaction_mode (transactionTypeId, name) values(2, 'Cash');
INSERT INTO bank.transaction_mode (transactionTypeId, name) values(2, 'Cheque');
INSERT INTO bank.transaction_mode (transactionTypeId, name) values(2, 'UPI');

INSERT INTO bank.failed_transaction_error_type (name) values('Withdraw limit reached');
INSERT INTO bank.failed_transaction_error_type (name) values('Daily limit reached');
INSERT INTO bank.failed_transaction_error_type (name) values('Low balance');
INSERT INTO bank.failed_transaction_error_type (name) values('Invalid denomination');
INSERT INTO bank.failed_transaction_error_type (name) values('ATM machine down');