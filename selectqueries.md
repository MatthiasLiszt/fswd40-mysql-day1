#select querry samples

## inner join

select book.book_ID,genre.genre from book inner join genre on genre.genre = 'adventure' and genre.book_ID=book.book_I

## left join

select book.book_ID,genre.genre from book left join genre on genre.genre = 'adventure' and genre.book_ID=book.book_ID;

## right join

select book.book_ID,genre.genre from book right join genre on genre.genre = 'adventure' and genre.book_ID=book.book_ID;

### comments

non-matching are filled with NULL with 'left join' and 'right join'

## full join

select book.book_ID,genre.genre from book left join genre on genre.genre = 'adventure' and genre.book_ID=book.book_ID 
UNION 
select book.book_ID,genre.genre from book right join genre on genre.genre = 'adventure' and genre.book_ID=book.book_ID;

### comments

'full join' is not implemented in MySQL 
