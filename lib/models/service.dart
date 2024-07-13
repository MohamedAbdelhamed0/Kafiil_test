class ServiceModel {
  final String name;
  final double rate;
  final int numberOfPeople;
  final double cost;

  ServiceModel({
    required this.name,
    required this.rate,
    required this.numberOfPeople,
    required this.cost,
  });
}

List<ServiceModel> generateDummyServices() {
  return [
    ServiceModel(
        name: 'Logo Design -Graphic Design Graphic Design',
        rate: 4.8,
        numberOfPeople: 300,
        cost: 1500.0),
    ServiceModel(
        name: 'App Development', rate: 4.9, numberOfPeople: 250, cost: 2000.0),
    ServiceModel(
        name: 'Graphic Design', rate: 4.7, numberOfPeople: 220, cost: 500.0),
    ServiceModel(
        name: 'SEO Optimization', rate: 4.6, numberOfPeople: 180, cost: 800.0),
    ServiceModel(
        name: 'Content Writing', rate: 4.5, numberOfPeople: 150, cost: 300.0),
    ServiceModel(
        name: 'Cybersecurity', rate: 4.9, numberOfPeople: 120, cost: 2500.0),
    ServiceModel(
        name: 'Data Analysis', rate: 4.8, numberOfPeople: 200, cost: 1200.0),
    ServiceModel(
        name: 'IT Support', rate: 4.4, numberOfPeople: 170, cost: 600.0),
    ServiceModel(
        name: 'Database Management',
        rate: 4.7,
        numberOfPeople: 140,
        cost: 1000.0),
    ServiceModel(
        name: 'Network Administration',
        rate: 4.6,
        numberOfPeople: 160,
        cost: 1100.0),
  ];
}
