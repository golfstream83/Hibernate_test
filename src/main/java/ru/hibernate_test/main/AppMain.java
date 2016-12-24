package ru.hibernate_test.main;

/**
 * @author Viktor Tulin
 * @version 1
 * @since 24.12.2016
 */
import org.hibernate.Session;
import ru.hibernate_test.dao.ContactEntity;
import ru.hibernate_test.utils.HibernateSessionFactory;

public class AppMain {

    public static void main(String[] args) {
        System.out.println("Hibernate tutorial");

        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        session.beginTransaction();

        ContactEntity contactEntity = new ContactEntity();

        contactEntity.setBirthDate(new java.util.Date());
        contactEntity.setFirstName("Nick");
        contactEntity.setLastName("VN");

        session.save(contactEntity);
        session.getTransaction().commit();

        session.close();


    }
}
