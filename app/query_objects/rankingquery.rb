class PostWithPopularityQuery
  def self.call
    pin.find_by_sql ['SELECT id, upvotes, downvotes,
        ((upvotes + 1.9208) / (upvotes + downvotes) -
        1.96 * SQRT((upvotes * negative) / (upvotes + downvotes) + 0.9604) /
        (upvotes + downvotes)) / (1 + 3.8416 / (upvotes + downvotes))
        AS ci_lower_bound
      FROM pins 
      WHERE upvotes + downvotes > 0
      ORDER BY ci_lower_bound DESC']
  end
end