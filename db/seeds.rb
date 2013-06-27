(1..3).each do |i|
	Category.create(name: "Category #{i}", description: "Description #{i}")
	Entry.create(title: "Entry #{i}", content: "Content #{i}")
end

(1..3).each do |i|
	(1..2).each do |j|
		k = i + j
		k -= 3 if k > 3
		Categorization.create(category_id: i, entry_id: k)
	end
end

[[1, 1], [1, 2], [1, 3], [2, 2], [3, 1], [3, 3]].each do |i, j|
	Comment.create(author: "Author #{i}", content: "Comment #{i}", entry_id: j)
end

User.create(email: "trantuananh@2359media.com.vn", password: "password", password_confirmation: "password")