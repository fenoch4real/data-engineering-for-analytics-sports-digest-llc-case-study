#1.)  Select number of matches played in the 2019-2020 season by age, in descending order

SELECT
	(sum(ps.minutes_played_home) + sum(ps.minutes_played_away)) as total_minutes_played,
    (p.age - 1) as age
FROM
	player_statistics ps
		INNER JOIN
	league_season ls ON ls.league_season_id = ps.season_id
		INNER JOIN
	player p ON ps.Player_player_id = p.player_id
WHERE
	ls.season = ('2019/2020') AND age > 0 
GROUP BY
	age
ORDER BY
	total_minutes_played DESC;
    #p.age;
    



#2.)  Top 10 goal scorers and assists, last 5 complete seasons
		
SELECT
	(sum(ps.goals_home) + sum(ps.goals_away)) as total_goals_scored,
    #(sum(ps.assists_home) + sum(ps.assists_away)) as total_assists,
    CONCAT (p.first_name,' ',p.last_name) as player_name,
    p.position
FROM
	player_statistics ps
		INNER JOIN
	league_season ls ON ls.league_season_id = ps.season_id
		INNER JOIN
	player p ON ps.Player_player_id = p.player_id
WHERE
	ls.season IN ('2019/2020','2018/2019','2017/2018','2016/2017','2015/2016') 
GROUP BY
	player_name
ORDER BY
	total_goals_scored DESC
	#total_assists DESC
LIMIT 10;
    


#3.)  Distribution of Player Nationality (by Country)

SELECT
	COUNT(player_id) as player_count,
    c.name as country
FROM
	player p
		INNER JOIN
	country c ON p.player_country_id = c.country_id
#WHERE
	#ls.season IN ('2019/2020','2018/2019','2017/2018','2016/2017','2015/2016') 
GROUP BY
	country
ORDER BY
	player_count DESC;
    
    
#4.)  Wins (home vs away) by Season

SELECT
	sum(ts.wins_home) as wins_home,
    sum(ts.wins_away) as wins_away,
    ls.season
FROM
	team_statistics ts
		INNER JOIN
	league_season ls ON ls.league_season_id = ts.League_Season_league_season_id
#WHERE
	#ls.season IN ('2019/2020','2018/2019','2017/2018','2016/2017','2015/2016') 
GROUP BY
	season
ORDER BY
	season DESC;    
    

