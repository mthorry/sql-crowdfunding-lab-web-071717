# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
    # selects the titles of each project (projects.title), the project_id (projects.id / pledges.project_id), the pledge_id (pledges.id) and pledge amount (pledges.amount)
    #  FIND titles of each project must come from projects table
    #  FIND project id can come from pledges table OR projects table
    #  FIND pledges amount for each project id must come from pledges table
    "SELECT projects.title, SUM(pledges.amount)
        FROM projects
        JOIN pledges
        ON projects.id = pledges.project_id
        GROUP BY(projects.title)"
end


def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
    # selects the username, age and pledge amount for all
    # groups by username
    "SELECT users.name, users.age, SUM(pledges.amount)
        FROM users
        JOIN pledges
        ON pledges.user_id = users.id
        GROUP BY(users.name)"
end


def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
    # selects the project titles (projects.title),
    # total amount (SUM(pledges.amount) + pledges.project_id),
    # goal amount (projects.funding_goal),
    # amount over goal (GROUP BY (pledges.project_id) SUM(pledges))
    # returns projects that have met/exceeded goal
    "SELECT projects.title, SUM(pledges.amount) - projects.funding_goal
        FROM pledges
        JOIN projects
        ON pledges.project_id = projects.id
        GROUP BY(pledges.project_id)
        HAVING projects.funding_goal <= SUM(pledges.amount)"

end


def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
    # selects usernames with total amount they pledged
    # from pledges + joins users tables
    # whenever the users.id = pledges.user_id
    # groups results by username
    #orders them first by total amount pledged, then by username
    # orders them by amount and username
    "SELECT users.name, SUM(pledges.amount)
    FROM pledges
    JOIN users
    ON users.id = pledges.user_id
    GROUP BY users.name
    ORDER BY SUM(pledges.amount), users.name"
end


def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
    #select category name, pledges amount to return
    # from projects, join pledges
    # whenever the pledges project_id = projects.id
    # but then JUST pull out the project category 'music'
    "SELECT projects.category, pledges.amount
    FROM projects
    JOIN pledges
    ON pledges.project_id = projects.id
    WHERE projects.category = 'music'"
end


def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
    # select category name, pledges amount to return
    # from projects, join pledges
    # whenever the pledges project_id = projects.id
    # but then JUST pull out the project category 'books'
    "SELECT projects.category, SUM(pledges.amount)
    FROM projects
    JOIN pledges
    ON pledges.project_id = projects.id
    WHERE projects.category = 'books'"
end
