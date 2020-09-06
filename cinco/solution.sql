use cinco;
set global local_infile = True;


-- 5.1
select '5.1' as '';
select COUNT(jezyk) as liczba, rodzina from jezyki
group by rodzina
order by liczba DESC;

-- 5.2
select '5.2' as '';
select COUNT(*) from (
  select 
      u.jezyk
    , SUM(
        case when u.urzedowy = 'nie' 
          then 1 
          else 0 
        end
      ) as c 
  from uzytkownicy u 
  group by u.jezyk 
  having c = 0
) as A
;

-- 5.3
select '5.3' as '';
select jezyk 
from (
  select 
    COUNT(DISTINCT(p.kontynent)) as cnt, 
    j.jezyk as 'jezyk'    
    from uzytkownicy u   
    inner join panstwa p on p.panstwo = u.panstwo  
    inner join jezyki j on j.jezyk = u.jezyk 
    group by u.jezyk
) as A where cnt >= 4
;

-- 5.4
select '5.4' as '';
select SUM(u.uzytkownicy) pop, j.rodzina, j.jezyk
from uzytkownicy u
inner join jezyki j  on j.jezyk   = u.jezyk
inner join panstwa p on p.panstwo = u.panstwo
where 
  (p.kontynent = 'Ameryka Poludniowa'
  and not j.rodzina = 'indoeuropejska')
group by j.rodzina, j.jezyk
order by pop ASC;

select '5.5' as '';
select p.panstwo, j.jezyk
from panstwa p, jezyki j, uzytkownicy u
where p.panstwo                    = u.panstwo
  and j.jezyk                      = u.jezyk
  and u.urzedowy                   = 'nie'
  and u.uzytkownicy / p.populacja >= 0.3
;