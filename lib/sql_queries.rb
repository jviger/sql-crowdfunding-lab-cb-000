# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"select title, sum(amount) from projects a left join pledges b on a.id = b.project_id group by a.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"select name, age, sum(amount) from users a left join pledges b on a.id = b.user_id group by a.name, a.age"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"select title, total - funding_goal from projects a left join (select a.id, sum(amount) as total from projects a left join pledges b on a.id = b.project_id group by a.id) b on a.id = b.id where funding_goal <= b.total group by title"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"select b.name, a.total from (select user_id, sum(amount) as total from pledges group by user_id) a left join users b on a.user_id = b.id group by name order by total, name"

end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"select b.category, amount from (select project_id, amount from pledges) a left join projects b on a.project_id = b.id where b.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"select b.category, sum(amount) as total from (select project_id, amount from pledges) a left join projects b on a.project_id = b.id where b.category = 'books' group by b.category"
end
