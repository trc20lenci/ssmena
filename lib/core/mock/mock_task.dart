/// Plain UI-only model — NOT wired to Supabase. Phase 2 is UI +
/// navigation + mock data only (no repositories, no services).
class MockTask {
  const MockTask({
    required this.id,
    required this.title,
    required this.category,
    required this.payAmount,
    required this.city,
    required this.distanceKm,
    required this.timeLabel,
    required this.isUrgent,
    this.description = '',
  });

  final String id;
  final String title;
  final String category;
  final double payAmount; // BYN
  final String city;
  final double distanceKm;
  final String timeLabel;
  final bool isUrgent;
  final String description;
}

/// Belarusian cities used across mock data / location pickers.
const List<String> mockCities = [
  'Минск',
  'Гомель',
  'Витебск',
  'Могилёв',
  'Гродно',
  'Брест',
];

/// Task categories shown in the feed / category picker.
const List<String> mockCategories = [
  'Всё',
  'Уборка',
  'Переезд',
  'Ремонт',
  'Выгул животных',
  'Доставка',
  'Разное',
];

const List<MockTask> mockTasks = [
  MockTask(
    id: 't1',
    title: 'Помочь донести продукты до 5 этажа',
    category: 'Разное',
    payAmount: 15,
    city: 'Минск',
    distanceKm: 0.8,
    timeLabel: 'Сегодня, сейчас',
    isUrgent: true,
    description: 'Два пакета с продуктами, лифта нет. Нужно поднять на 5 этаж.',
  ),
  MockTask(
    id: 't2',
    title: 'Выгулять собаку 30 минут',
    category: 'Выгул животных',
    payAmount: 12,
    city: 'Минск',
    distanceKm: 1.2,
    timeLabel: 'Сегодня, 18:00',
    isUrgent: false,
    description: 'Спокойный лабрадор, нужен выгул на поводке в парке рядом.',
  ),
  MockTask(
    id: 't3',
    title: 'Уборка однокомнатной квартиры',
    category: 'Уборка',
    payAmount: 45,
    city: 'Гомель',
    distanceKm: 2.4,
    timeLabel: 'Завтра, 10:00',
    isUrgent: false,
    description: 'Влажная уборка, мытьё окон, вынос мусора.',
  ),
  MockTask(
    id: 't4',
    title: 'Помощь при переезде — вынос мебели',
    category: 'Переезд',
    payAmount: 80,
    city: 'Минск',
    distanceKm: 3.1,
    timeLabel: 'Сегодня, 14:00',
    isUrgent: true,
    description: 'Нужно 2 человека, диван и шкаф, 3 этаж без лифта.',
  ),
  MockTask(
    id: 't5',
    title: 'Собрать кухонный шкаф (IKEA)',
    category: 'Ремонт',
    payAmount: 35,
    city: 'Витебск',
    distanceKm: 4.6,
    timeLabel: 'Завтра, 12:00',
    isUrgent: false,
    description: 'Инструкция и инструменты есть, нужна сборка одного шкафа.',
  ),
  MockTask(
    id: 't6',
    title: 'Забрать посылку из пункта выдачи',
    category: 'Доставка',
    payAmount: 10,
    city: 'Минск',
    distanceKm: 0.5,
    timeLabel: 'Сегодня, до 20:00',
    isUrgent: true,
    description: 'Небольшая коробка, пункт выдачи в соседнем доме.',
  ),
];
