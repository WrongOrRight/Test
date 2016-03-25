package com.web.mavenproject6.config;

import java.util.Properties;
import javax.annotation.Resource;
import javax.sql.DataSource;
import org.hibernate.ejb.HibernatePersistence;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration//аннотация, указывающая что файл является кофигурационным
@EnableTransactionManagement//Разрешение транзакций
@EnableJpaRepositories("com.web.mavenproject6.repositories")//указание папки, содержащей набор классов для работы с табалицами
@PropertySource("resources/application.properties")//файл конфигурации
public class DataBaseConfig {

    private static final String PROPERTY_NAME_DATABASE_DRIVER = "jdbc.driverClassName";//параметр из файла конфигурации, отвечает за имя драйвера БД
    private static final String PROPERTY_NAME_DATABASE_PASSWORD = "jdbc.password";//параметр из файла конфигурации, отвечает за пароль к БЖ
    private static final String PROPERTY_NAME_DATABASE_URL = "jdbc.url";//параметр из файла конфигурации, отвечает за путь к БЖ
    private static final String PROPERTY_NAME_DATABASE_USERNAME = "jdbc.username";//параметр из файла конфигурации, отвечает за имя пользователя БЖ

    private static final String PROPERTY_NAME_HIBERNATE_DIALECT = "hibernate.dialect";//параметр из файла конфигурации, отвечает за тип базы данных к БЖ
    private static final String PROPERTY_NAME_HIBERNATE_SHOW_SQL = "hibernate.show_sql";//параметр из файла конфигурации, отвечает за генерацию кода sql в лог проекта
    private static final String PROPERTY_NAME_ENTITYMANAGER_PACKAGES_TO_SCAN = "entitymanager.packages.to.scan";//параметр из файла конфигурации, отвечает за путь к папке с классами таблицы
   
    @Resource//аннотация, связывающая файл конфигурации с переменной в проекте
    private Environment env;//переменная, содержащая конфигурации из файла конфигураций. Значения в виде списка [ключ]:[значение]

    @Bean//подключение функции dataSource к ядру spring
    public DataSource dataSource() { //создание источника данных, на основе конфигурации
        DriverManagerDataSource dataSource = new DriverManagerDataSource();//подключение драйвера с помощью менеджера драйверов различных источников данных, для работы настройки источника данных

        dataSource.setDriverClassName(env.getRequiredProperty(PROPERTY_NAME_DATABASE_DRIVER));//установка драйвера бд
        dataSource.setUrl(env.getRequiredProperty(PROPERTY_NAME_DATABASE_URL));//установка пути к бд
        dataSource.setUsername(env.getRequiredProperty(PROPERTY_NAME_DATABASE_USERNAME));//установка имени пользователя бд
        dataSource.setPassword(env.getRequiredProperty(PROPERTY_NAME_DATABASE_PASSWORD));//установка пароля от бд

        return dataSource; //возвращаем настреонный компонент источника данных
    }

    @Bean //подключение функции entityManagerFactory к ядру spring
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() { //возвращает локальный менеджер для связи  с бд

        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();// создание адаптера для работы с источником данных
        vendorAdapter.setDatabase(Database.POSTGRESQL); //устанавливаем тип бд
        vendorAdapter.setGenerateDdl(true);

        LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();//создание локального менеджера связей классов java с бд
        entityManagerFactoryBean.setDataSource(dataSource());//подключение источника данных
        entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistence.class);
        entityManagerFactoryBean.setPackagesToScan(env.getRequiredProperty(PROPERTY_NAME_ENTITYMANAGER_PACKAGES_TO_SCAN));//установка расположения классов java, отвечающих за созадание таблиц в бд
        entityManagerFactoryBean.setJpaProperties(hibProperties());//подключение доп настроек hibernate
        entityManagerFactoryBean.setJpaVendorAdapter(vendorAdapter);//подключение адаптера для работы с источником данных

        return entityManagerFactoryBean; //возвращаем созданный менеджер связей
    }

    private Properties hibProperties() {//создание объекта настроек для hibernate
        Properties properties = new Properties(); //параметры настроек
        properties.put(PROPERTY_NAME_HIBERNATE_DIALECT, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_DIALECT));//устанавлвиаем настройки диалекта
        properties.put(PROPERTY_NAME_HIBERNATE_SHOW_SQL, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_SHOW_SQL));//устанавливаем настройки отображения sql в логе
        return properties; //возвращаем настройки
    }

    @Bean//подключение функции transactionManager к ядру spring
    public PlatformTransactionManager transactionManager() { //создание менеджера транзакций

        JpaTransactionManager txManager = new JpaTransactionManager(); //новый менеджер транзакций
        txManager.setEntityManagerFactory(entityManagerFactory().getObject());//подключение менеджера связи с бд к менеджеру транзакций
        return txManager;//возвращаем менеджер транзакций
    }

}
