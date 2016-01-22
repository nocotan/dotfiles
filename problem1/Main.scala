object Main extends App {
  val sc = new java.util.Scanner(System.in)
  val n: Int = sc.nextInt
  println((1 until n).filter(i => i % 3 ==0 || i % 5 == 0).sum)
}
