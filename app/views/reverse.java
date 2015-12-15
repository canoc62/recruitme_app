public class Reverse {


	static int[] reverse(int[] array) {
		for(int i =0; i < array.length()/2;i++){

			int temp = array[i];
			int toSwitch = array[array.length() - 1 - i];
			array[i] = toSwitch;
			array[array.length() - 1 - i ] = temp;

		}
	}
	public static void main(String[] args){

		int[] array = [1,2,3,4,5];

		System.out.println(reverse(array));

	}


}