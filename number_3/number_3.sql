SET NOCOUNT ON;

with score as (
    select 
        t1.challenge_id,
        t2.score as max_score
    from challenges t1
    join difficulty t2 on t1.difficulty_level = t2.difficulty_level
),

count_raw as (
    select 
        t3.hacker_id,
        count(*) as full_solved
    from submissions t3
    join score t4 on t3.challenge_id = t4.challenge_id
    where t3.score = t4.max_score
    group by t3.hacker_id
    having count(*) > 1
),

final as (
    select
        t6.hacker_id,
        t6.name,
        t5.full_solved
    from count_raw t5
    join hackers t6
        on t5.hacker_id = t6.hacker_id
)

select hacker_id, name
from final
order by full_solved desc, hacker_id asc;

go
