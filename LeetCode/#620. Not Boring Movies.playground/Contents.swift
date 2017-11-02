/* 2017. 8. 2 
 
 X city opened a new cinema, many people would like to go to this cinema. The cinema also gives out a poster indicating the movies’ ratings and descriptions.
 
 Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'. Order the result by rating.
 
 
 X City 開了一間電影院， 這間電影院給客人提供了一張海報，上面寫著每部電影的評價與評論。
 現在請用 SQL 查出奇數的電影 ID，還有評論不為'boring'的電影，最後依評價最高到最低列出來。
 
 
 For example, table cinema:
 +---------+-----------+--------------+-----------+
 |   id    | movie     |  description |  rating   |
 +---------+-----------+--------------+-----------+
 |   1     | War       |   great 3D   |   8.9     |
 |   2     | Science   |   fiction    |   8.5     |
 |   3     | irish     |   boring     |   6.2     |
 |   4     | Ice song  |   Fantacy    |   8.6     |
 |   5     | House card|   Interesting|   9.1     |
 +---------+-----------+--------------+-----------+
 
 
 For the example above, the output should be:
 +---------+-----------+--------------+-----------+
 |   id    | movie     |  description |  rating   |
 +---------+-----------+--------------+-----------+
 |   5     | House card|   Interesting|   9.1     |
 |   1     | War       |   great 3D   |   8.9     |
 +---------+-----------+--------------+-----------+
 
 */

let query = "SELECT * FROM cinema " +
"WHERE description != 'boring' AND (id%2) = 1 " +
"ORDER BY rating DESC"

print(query)
