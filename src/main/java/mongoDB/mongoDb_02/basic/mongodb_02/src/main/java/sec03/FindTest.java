package sec03;
import app.Database;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import java.util.Iterator;
public class FindTest {
    public static void main(String[] args) {
        MongoCollection<Document> collection = Database.getCollection("todo");
        FindIterable<Document> doc = collection.find();

        // FindIterable ==> mySQL jdbc에서 ResultSet에 해당
        // 반복해서 꺼내주는 기능이 없음 --> 외부 반복자를 만들어주어야함
        // Iterator
        Iterator itr = doc.iterator(); // 이 함수를 제공해주기 때문에 사용할 수 있는거다.
        while (itr.hasNext()) {
            System.out.println("==> findResultRow : "+itr.next());
        }

        // itr.hasNext()가 false일 때까지 무한 반복
        Database.close();
    }
}