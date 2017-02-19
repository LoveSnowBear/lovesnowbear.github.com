package sample.skills.data.hibernate;

import java.sql.Connection;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import com.bstek.dorado.common.ds.ConnectionHelper;

public class HibernateUtils {
	private static final String CONFIGURE = "sample/skills/data/hibernate/hibernate.cfg.xml";
	private static final SessionFactory sessionFactory;

	static {
		try {
			// Create the SessionFactory
			Configuration configuration = new Configuration()
					.configure(CONFIGURE);
			sessionFactory = configuration.buildSessionFactory();
		} catch (Throwable ex) {
			// Make sure you log the exception, as it might be swallowed
			System.out.println("Initial SessionFactory creation failed.");
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static final ThreadLocal session = new ThreadLocal();

	public static Session openSession() throws Exception {
		Session s = (Session) session.get();
		// Open a new Session, if this Thread has none yet
		if (s == null) {
			Connection connection = ConnectionHelper.getDefaultConnection();
			s = sessionFactory.openSession(connection);
			session.set(s);
		}
		return s;
	}

	public static void closeSession() throws Exception {
		Session s = (Session) session.get();
		if (s != null) {
			Connection connection = s.close();
			connection.close();
		}
		session.set(null);
	}
}
