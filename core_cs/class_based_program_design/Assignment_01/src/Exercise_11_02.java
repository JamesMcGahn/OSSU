/*
Exercise 11.2 Exercise 3.2 provides the data definition for a weather recording program. Design the following methods for the WeatherRecord class:
1. withinRange, which determines whether today’s high and low were
within the normal range;
2. rainyDay, which determines whether the precipitation is higher than
some given value;
3. recordDay, which determines whether the temperature broke either
the high or the low record.
*/

class Date {
	int day;
	int month;
	int year;

	Date(int day, int month, int year) {
		this.day = day;
		this.month = month;
		this.year = year;

	}

}

class TemperatureRange {
	int high;
	int low;

	TemperatureRange(int low, int high) {
		this.low = low;
		this.high = high;
	}

}

class WeatherRecord {
	Date d;
	TemperatureRange today;
	TemperatureRange normal;
	TemperatureRange record;

	WeatherRecord(TemperatureRange today, TemperatureRange normal, TemperatureRange record) {
		this.today = today;
		this.normal = normal;
		this.record = record;

	}

	boolean withinRange() {

		return this.today.low >= this.normal.low && this.today.low <= this.normal.high
				&& this.today.high >= this.normal.low && this.today.high <= this.normal.high;
	}

	boolean rainyDay(int precipitation, int value) {
		return precipitation > value;

	}

	boolean recordDay() {
		return this.today.low < this.record.low || this.today.high > this.record.high;

	}

}