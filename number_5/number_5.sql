SET NOCOUNT ON;


with MaxScore as (
    select 
        hacker_id,
        challenge_id,
        max(score) as max_score
    from Submissions
    group by hacker_id, challenge_id
),

Score as (
    select
        t2.hacker_id,
        t2.name,
        t1.max_score
    from MaxScore t1 join Hackers t2 on t1.hacker_id = t2.hacker_id
)

select 
    hacker_id,
    name,
    sum(max_score) as score
from score
group by hacker_id, name
having sum(max_score) > 0
order by score desc, hacker_id asc;
go
