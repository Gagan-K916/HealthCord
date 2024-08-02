# HealthCord - Patient Management System

![SQLITE](https://img.shields.io/badge/Sqlite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![Python](https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Netlify](https://img.shields.io/badge/Netlify-00C7B7?style=for-the-badge&logo=netlify&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)

---

HealthCord is a comprehensive patient and health record management system designed to streamline healthcare operations and enhance patient care. This application provides healthcare professionals with an intuitive interface to manage patient data, appointments, prescriptions, and collaborate with colleagues efficiently.

[![image](https://github.com/user-attachments/assets/70c88f24-e0cf-4d68-8afe-91ba81165a62)](https://healthcord.netlify.app/)

## Features

- **Patient Management**: Easily add, view, and update patient information.
- **Appointment Scheduling**: Efficiently manage and track patient appointments.
- **Prescription Management**: Assign and monitor patient prescriptions.
- **Colleague Directory**: Access a list of colleagues with their expertise for seamless patient referrals.
- **Advanced Filtering**: Utilize powerful filtering options across all sections for quick and precise information retrieval.
- **Dashboard Analytics**: Gain valuable insights through an interactive dashboard.

## Technologies Used

- **Frontend & Backend**: Flutter
- **Database**: SQLite
- **Programming Language**: Dart
- **API**: Python Flask

## Dashboard Insights

[![image](https://github.com/user-attachments/assets/e72e0b8b-e91b-4223-bc74-f6d6bd531eec)](https://healthcord.netlify.app/)


The dashboard provides doctors with critical insights:

1. Patient Demographics
2. Appointment Statistics
3. Prescription Trends
4. Colleague Specialization Distribution

[![image](https://github.com/user-attachments/assets/4970d191-5c3a-424e-9e84-990e061ccdd6)](https://healthcord.netlify.app/)


These analytics are powered by SQL queries, transforming raw data into actionable insights. The dashboard leverages advanced SQL techniques such as subqueries, and aggregations to process and visualize large datasets effectively.

## Key Technical Aspects

- **Efficient Data Retrieval**: Implemented optimized SQL queries to ensure swift data access even with large patient records.
- **Data Integrity**: Utilized SQLite transactions to maintain data consistency across related tables.
- **Performance Optimization**: Employed stored procedures for frequently used complex queries, significantly improving response times.
- **Dynamic Filtering**: Implemented parameterized queries to support the advanced filtering functionality across all sections.

## Installation and Setup

The project is hosted on the cloud using Netlify, and you can view it using this [link](https://healthcord.netlify.app/).

<abbr>OR</abbr>

To get HealthCord up and running on your local machine, follow these steps:

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Git](https://git-scm.com/downloads)
- [Python](https://www.python.org/downloads/)
- [SQLite](https://www.sqlite.org/download.html)

### Cloning the Repository

1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the project.
3. Run the following command: 
   ```git clone https://github.com/Gagan-K916/HealthCord.git```
4. Once you are done installing the prerequisistes, navigate into the project directory and run the code: ```flutter run -d chrome```

## Future Enhancements

- Integration with external health record systems
- Implementation of machine learning models for predictive health analytics
- Integration of Real-Time Messaging for better communication.
- Adding an AI Chatbot fine-tuned to answer health related queries
