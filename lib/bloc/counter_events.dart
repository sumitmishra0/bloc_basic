abstract class CounterEvents {}

class IncrementCountEvents extends CounterEvents {
 final int value;
 IncrementCountEvents({ this.value = 1});
}


class DecrementCountEvents extends CounterEvents {

}