'Tabela clientes'
create table customers(
	id BIGINT PRIMARY key,
    name VARCHAR(100) not NULL,
    age SMALLINT not NULL,
    create_date DATE
);

'Tabela moedas'
create table currencies(
	currency VARCHAR(4) PRIMARY key,
    DESCRIPTION VARCHAR(30) not NULL
);

'Tabela tipo de conta'
create TABLE account_type (
	id VARCHAR(30) PRIMARY key,
    DESCRIPTION VARCHAR(30) not NULL
);

'Tabela contas'
create TABLE accounts(
	id BIGINT primary key,
    branch VARCHAR(8) not NULL,
    number VARCHAR(30) not NULL,
    currency VARCHAR(4) NOT NULL,
    amount money not NULL,
    customer_id BIGINT NOT NULL,
    create_date DATE NOT NULL,
    type_id VARCHAR(30) NOT NULL,
    is_active BOOLEAN not null DEFAULT TRUE,
    UNIQUE(customer_id, currency),
    UNIQUE(branch, number),
    FOREIGN KEY (type_id) REFERENCES account_type(id),
    FOREIGN KEY (currency) REFERENCES currencies(currency),
    FOREIGN KEY (customer_id) REFERENCES customers(ID)
);

'Tabela tipo de transação'
create TABLE transaction_type (
	id VARCHAR(50) PRIMARY key,
    DESCRIPTION VARCHAR(100) not NULL
);

'Tabela transações'
CREATE TABLE TRANSACTIONS (
	id BIGINT primary key,
    origin_branch VARCHAR(30),
    origin_account VARCHAR(30),
    destiny_branch VARCHAR(30) not NULL,
    destiny_account VARCHAR(30) not NULL,
    amount money not NULL,
    transaction_type VARCHAR(50) NOT NULL,
    currency VARCHAR(4) NOT NULL,
    created_date date not null,
    FOREIGN KEY (transaction_type) REFERENCES transaction_type(ID),
    FOREIGN KEY (currency) REFERENCES currencies(currency)
);

select * from accounts;

insert into transactions values (1,null, null, '0001', '3214', 100, 'ACC_CREDIT', 'USD', '2022-09-29');

insert into transactions values (2,'0001', '456787', '0001', '3214', 9500, 'INTERNAL_ACC_TRANSFER', 'USD', '2022-09-29');
update accounts set amount = 500 where id = 3;
update accounts set amount = 9600 where id = 2;

select * from transactions where destiny_account = '3214';

select * from account_type;
SELECT * from currencies;
SELECT * FROM customers;
select * from transaction_type;
update transaction_type SET description = 'Transferencia interna' where id = 'INTERNAL_ACC_TRANSFER'