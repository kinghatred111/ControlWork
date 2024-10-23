import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

abstract class Animal implements Serializable {
    protected String name; // имя
    protected String command; // команда
    protected Date birthDate; // дата рождения

    public Animal(String name, String command, Date birthDate) {
        this.name = name;
        this.command = command;
        this.birthDate = birthDate;
    }

    public abstract void showInfo();
}

// Class for domestic animals
class DomesticAnimals extends Animal {
    public DomesticAnimals(String name, String command, Date birthDate) {
        super(name, command, birthDate);
    }

    @Override
    public void showInfo() {
        System.out.println("Домашнее животное: " + name + ", Команда: " + command);
    }
}

// Class for pack animals
class PackAnimals extends Animal {
    public PackAnimals(String name, String command, Date birthDate) {
        super(name, command, birthDate);
    }

    @Override
    public void showInfo() {
        System.out.println("Вьючное животное: " + name + ", Команда: " + command);
    }
}

class Registry {
    private ArrayList<Animal> animals;
    private final String filePath = "animals.dat";

    public Registry() {
        animals = new ArrayList<>();
        loadAnimals();
    }

    public void registerNewAnimal(String name, String command, Date birthDate, boolean isDomestic) {
        Animal newAnimal;
        if (isDomestic) {
            newAnimal = new DomesticAnimals(name, command, birthDate);
        } else {
            newAnimal = new PackAnimals(name, command, birthDate);
        }
        animals.add(newAnimal);
        saveAnimals();
    }

    public void showAnimals() {
        for (Animal animal : animals) {
            animal.showInfo();
        }
    }

    private void saveAnimals() {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(filePath))) {
            oos.writeObject(animals);
        } catch (IOException e) {
            System.out.println("Ошибка при сохранении животных: " + e.getMessage());
        }
    }

    @SuppressWarnings("unchecked")
    private void loadAnimals() {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(filePath))) {
            animals = (ArrayList<Animal>) ois.readObject();
        } catch (FileNotFoundException e) {

        } catch (IOException | ClassNotFoundException e) {
            System.out.println("Ошибка при загрузке животных: " + e.getMessage());
        }
    }
}

class Counter implements AutoCloseable {
    private int count;
    private boolean isOpen;

    public Counter() {
        this.count = 0;
        this.isOpen = true;
    }

    public void add() {
        if (!isOpen) {
            throw new IllegalStateException("Counter is not open.");
        }
        count++;
    }

    public int getCount() {
        if (!isOpen) {
            throw new IllegalStateException("Counter is not open.");
        }
        return count;
    }

    @Override
    public void close() {
        isOpen = false;
    }
}

public class AnimalRegistry {
    public static void main(String[] args) {
        Registry registry = new Registry();
        Scanner scanner = new Scanner(System.in);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        while (true) {
            System.out.println("1. Завести новое животное");
            System.out.println("2. Показать список животных");
            System.out.println("3. Выход");
            System.out.print("Выберите действие: ");
            int choice = scanner.nextInt();
            scanner.nextLine();

            if (choice == 1) {
                System.out.print("Введите имя животного: ");
                String name = scanner.nextLine();
                System.out.print("Введите команду: ");
                String command = scanner.nextLine();
                System.out.print("Введите дату рождения (гггг-мм-дд): ");
                String date = scanner.nextLine();

                Date birthDate = null;
                try {
                    birthDate = dateFormat.parse(date);
                } catch (ParseException e) {
                    System.out.println("Неверный формат даты. Пожалуйста, используйте формат гггг-мм-дд.");
                    continue;
                }

                System.out.print("Это домашнее животное? (да/нет): ");
                boolean isDomestic = scanner.nextLine().equalsIgnoreCase("да");

                try (Counter counter = new Counter()) {
                    registry.registerNewAnimal(name, command, birthDate, isDomestic);
                    counter.add();
                    System.out.println("Количество зарегистрированных животных: " + counter.getCount());
                } catch (IllegalStateException e) {
                    System.out.println("Ошибка: " + e.getMessage());
                }
            } else if (choice == 2) {
                registry.showAnimals();
            } else if (choice == 3) {
                break;
            } else {
                System.out.println("Неверный выбор. Пожалуйста, попробуйте снова.");
            }
        }

        scanner.close();
    }
}