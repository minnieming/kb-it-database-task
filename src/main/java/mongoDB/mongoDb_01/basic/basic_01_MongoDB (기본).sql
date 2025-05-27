-- 1. 데이터베이스를 tutorial로 선정하세요.
use tutorial
db.createCollection("users")

-- 2. users 컬렉션에 username이 "smith"인 문서를 저장하세요.
db.users.insertOne({username:"smith"})

-- 3. users 컬렉션에 username이 "jones"인 문서를 저장하세요.
db.users.insertOne({username:'jones'})

-- 4. 앞에서 저장한 모든 문서를 출력하세요.
db.users.find()

-- 5. 앞에서 저장한 문서 중 하나만 출력하세요.
db.users.findOne()

-- 6. users 컬렉션에서 username이 "jones"인 문서를 찾아서 출력하세요. 
db.users.find({username:'jones'})

-- 7. users 컬렉션에서 username이 "jones" 또는 "smith"인 문서를 찾아서 출력하세요.
db.users.find({$or:[{username:'jones'},{username:'smith'}]})

-- 8. users 컬렉션에서 username이 "smith"인 문서에 country 키가 "Canada"가 되도록 수정하세요.
db.users.updateOne({username:'smith'},{$set:{country:'Canada'}})

-- 9. 앞의 문서가 올바르게 수정되었는지 확인하세요.
db.users.findOne({username:'smith'})

-- 10. users 컬렉션에서 username이 "smith"인 문서를 {country: "Canada"}로 대체하고 확인하세요.
db.users.updateOne({username:'smith'},{$set:{country:'Canada'}})
db.users.findOne({country:'Canada'})

-- 11. users 컬렉션에서 country가 "Canada"인 문서를 {username: "smith", country: "Canada"}로 대체하고 확인하세요.
db.users.updateOne({country:'Canada'},{$set:{username:'smith',country:'Canada'}})
db.users.find({username:'smith'})

-- 12. users 컬렉션에서 username이 "smith"인 문서에서 country 키를 삭제하고, 삭제 여부를 확인하세요.
db.users.updateOne({username:'smith'},{$unset:{country:1}})
db.users.findOne({username:'smith'})

-- 13. 데이터베이스 전체 목록을 출력하세요.
show dbs

-- 14. 현재 사용 중인 데이터베이스의 컬렉션 목록을 출력하세요.
show collections

-- 15. 현재 사용 중인 데이터베이스와 users 컬렉션의 상태를 출력하세요.
db.stats
db.users.stats

-- 16. users 컬렉션에서 username이 "smith"인 문서를 삭제하고, 삭제 여부를 확인하세요.
db.users.remove({username:'smith'})
db.users.findOne({username:'smith'})

-- 17. users 컬렉션의 모든 문서를 삭제하고, 삭제 여부를 확인하세요
db.users.remove({})
db.users.find()

-- 18. users 컬렉션을 삭제하세요.
db.users.drop()

-- 19. 다음 형태의 문서 20,000건을 추가하세요.
--   • database: test
--   • collection: product
--   • 문서 필드:
--     - num: 순번 (0부터 시작)
--     - name: '스마트폰 ' + 순번
db.users.drop()
use test
for (let i=0; i<20000; i++) {db.product.insert({num:i, name:'스마트폰'+i});}

-- 20. product 컬렉션의 전체 문서 수를 출력하세요.
db.product.count()

-- 21. product 컬렉션의 문서를 num의 내림차순으로 정렬하여 출력하세요.
db.product.find().sort({num:-1})

-- 22. product 컬렉션의 문서를 num의 내림차순으로 정렬하여 상위 10건을 출력하세요.
db.product.find().sort({num:-1}).limit(10)

-- 23. product 컬렉션의 문서를 num의 내림차순으로 정렬한 상태에서 다음을 처리하세요:
--   • 한 페이지당 10건씩 출력
--   • 6페이지에 해당하는 문서를 출력하세요.
db.product.find().sort({num:-1}).skip(10*(6-1)).limit(10)

-- 24. product 컬렉션에서 num이 15 미만이거나 19995 초과인 문서를 출력하세요.
db.product.find({$or:[{num:{$lt:15}, num:{$gt:19995}}]})

-- 25. product 컬렉션에서 name이 "스마트폰 10", "스마트폰 100", "스마트폰 1000" 중에 하나인 문서를 출력하세요.
db.product.find({name:{$in:['스마트폰10','스마트폰100','스마트폰1000']}})

-- 26. product 컬렉션에서 num이 5보다 작은 문서를 출력하는데, name만 출력하세요.
--     (※ _id는 출력하지 마세요)
db.product.find({num:{$lt:5}},{_id:0, name:1})
