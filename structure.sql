CREATE DATABASE IF NOT EXISTS bank DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE bank;

CREATE TABLE IF NOT EXISTS bank.branch
(
	code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	ifsc CHAR(11) NOT NULL,
	micr CHAR(10) NOT NULL,
	branchTelNo VARCHAR(15) NOT NULL,
	address text NOT NULL
)AUTO_INCREMENT = 1001;

CREATE TABLE IF NOT EXISTS bank.operation_mode
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS bank.account_type
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS bank.account_status_type
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS bank.customer
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	gender CHAR(1) NOT NULL,
	pan CHAR(10) NOT NULL,
	aadhaar CHAR(12) NOT NULL,
	address text NOT NULL,
	resTelNumber INT NOT NULL,
	mobileNumber INT NOT NULL
)AUTO_INCREMENT = 10001;

CREATE TABLE IF NOT EXISTS bank.customer_signature
(
	customerId INT NOT NULL,
	path text NOT NULL,
	CONSTRAINT FK_signature_customer_id FOREIGN KEY (customerId) REFERENCES bank.customer(id)
);

CREATE TABLE IF NOT EXISTS bank.customer_nominee
(
	customerId INT NOT NULL,
	name VARCHAR(100) NOT NULL,
	pan CHAR(10) NOT NULL,
	aadhaar CHAR(12),
	address text NOT NULL,
	CONSTRAINT FK_nominee_customer_id FOREIGN KEY (customerId) REFERENCES bank.customer(id)
);

CREATE TABLE IF NOT EXISTS bank.customer_account
(
	customerId INT NOT NULL,
	accountTypeId INT NOT NULL,
	accountStatusTypeId INT NOT NULL,
	accountNumber BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	branchCode INT NOT NULL,
	modeId INT NOT NULL,
	openDate DATE NOT NULL,
	nomination SMALLINT(1) NOT NULL,
	status TINYINT(1) DEFAULT 1 NOT NULL,
	CONSTRAINT FK_account_customer_id FOREIGN KEY (customerId) REFERENCES bank.customer(id),
	CONSTRAINT FK_account_type_id FOREIGN KEY (accountTypeId) REFERENCES bank.account_type(id),
	CONSTRAINT FK_account_status_type_id FOREIGN KEY (accountStatusTypeId) REFERENCES bank.account_status_type(id),
	CONSTRAINT FK_branch_code FOREIGN KEY (branchCode) REFERENCES bank.branch(code),
	CONSTRAINT FK_mode_id FOREIGN KEY (modeId) REFERENCES bank.operation_mode(id),
	CONSTRAINT UK_customer_account UNIQUE (customerId, accountTypeId)
)AUTO_INCREMENT = 5000001;

CREATE TABLE IF NOT EXISTS bank.transaction_type
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS bank.transaction_mode
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	transactionTypeId INT NOT NULL,
	name VARCHAR(30) NOT NULL,
	CONSTRAINT FK_transaction_mode_type_id FOREIGN KEY (transactionTypeId) REFERENCES bank.transaction_type(id)
);

CREATE TABLE IF NOT EXISTS bank.transactions
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customerId INT NOT NULL,
	transactionTypeId INT NOT NULL,
	transactionModeId INT NOT NULL,
	amount DECIMAL(10,2) NOT NULL,
	transactionDate DATE NOT NULL,
	particulars text NOT NULL,
	status SMALLINT(1) NOT NULL,
	CONSTRAINT FK_transaction_customer_id FOREIGN KEY (customerId) REFERENCES bank.customer(id),
	CONSTRAINT FK_transaction_type_id FOREIGN KEY (transactionTypeId) REFERENCES bank.transaction_type(id),
	CONSTRAINT FK_transaction_mode_id FOREIGN KEY (transactionModeId) REFERENCES bank.transaction_mode(id)
)AUTO_INCREMENT = 10001;

CREATE TABLE IF NOT EXISTS bank.transaction_reference
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	transactionId INT NOT NULL,
	CONSTRAINT FK_transaction_id FOREIGN KEY (transactionId) REFERENCES bank.transactions(id)
)AUTO_INCREMENT = 10001;

CREATE TABLE IF NOT EXISTS bank.failed_transaction_error_type
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS bank.failed_transactions
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customerId INT NOT NULL,
	failedtransactionTypeId INT NOT NULL,
	transactionModeId INT NOT NULL,
	amount DECIMAL(10,2) NOT NULL,
	transactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT FK_failed_transaction_customer_id FOREIGN KEY (customerId) REFERENCES bank.customer(id),
	CONSTRAINT FK_failed_transaction_type_id FOREIGN KEY (failedtransactionTypeId) REFERENCES bank.failed_transaction_error_type(id)
)AUTO_INCREMENT = 10001;

CREATE TABLE IF NOT EXISTS bank.login_details
(
	userLoginID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userId INT NOT NULL,	
	password varchar(200) NOT NULL,
	isEmployee tinyint(1) NOT NULL DEFAULT '0',
	status tinyint(1) NOT NULL DEFAULT '1'
)AUTO_INCREMENT = 420081;

CREATE TABLE IF NOT EXISTS bank.login_error_log
(
	userId INT NOT NULL,
	loginDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	description text	
);