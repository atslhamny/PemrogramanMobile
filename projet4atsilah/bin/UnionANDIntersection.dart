void main(){
  // 2. Program untuk menghitung union & intersection dari dua set
  print("2. UNION & INTERSECTION DARI DUA SET:");
  Set<String> set1 = {"Apel", "Jeruk", "Mangga", "Pisang", "Anggur"};
  Set<String> set2 = {"Mangga", "Pisang", "Semangka", "Melon", "Durian"};

  print("Set 1: $set1");
  print("Set 2: $set2");

  // Union (gabungan)
  Set<String> unionSet = set1.union(set2);
  print("Union (Gabungan): $unionSet");

  // Intersection (irisan)
  Set<String> intersectionSet = set1.intersection(set2);
  print("Intersection (Irisan): $intersectionSet\n");
}