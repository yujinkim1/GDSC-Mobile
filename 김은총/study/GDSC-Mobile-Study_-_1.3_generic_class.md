# GDSC-Mobile-Study - 1.3 (Class, Generics)

# 공부한 내용
> Class와 Generics에 대해 공부했습니다.

## 1. Class
> 객체 지향 프로그래밍(OOP) 기능을 지원합니다. 
1.1. **syntax**
```
class class_name {  
   <fields> 
   <getters/setters> 
   <constructors> 
   <functions> 
}
```

1.1.2 datamember
- <fields>
> 필드는 클래스에서 선언된 모든 변수입니다. 필드는 개체와 관련된 데이터를 나타냅니다.
- <Setters/Getters>
> 프로그램이 클래스 필드의 값을 초기화하고 검색할 수 있도록 합니다. 기본 getter/setter는 모든 클래스와 연결됩니다. 그러나 기본 설정은 setter/getter를 명시적으로 정의하여 재정의할 수 있습니다.
- <constructors>
> 클래스의 객체에 대한 메모리 할당을 담당합니다.
- <functions>
> 기능은 개체가 취할 수 있는 작업을 나타냅니다. 또한 때때로 방법이라고도 합니다.

### 1.2. **인스턴스**
> instantiation하는 것을 말합니다. 
1.2.1. new
>인스턴스를 생성하려면 new 키워드 다음에 클래스 이름을 사용하면 됩니다.
```
var object_name = new class_name([ arguments ])
```
1.2.2. final
>클래스에서 final을 사용해서 인스턴스를 생성할 때, 상수를 설정할 수 있습니다.

### 1.3. **생성자(constructors)**
> 생성자는 클래스의 변수 초기화를 담당합니다. 클래스와 동일한 이름의 생성자를 정의합니다. 생성자는 함수이므로 매개변수화할 수 있으나 함수와 달리 반환 유형은 가질 수 없습니다. 생성자를 선언하지 않으면 기본 인수가 없는 생성자가 제공됩니다.
```
Class_name(parameter_list) { 
   //constructor body 
}
```
> 생성자를 여러번 쓰기 위해 named 생성자를 사용합니다.
```
Class_name.constructor_name(param_list)
```

### 1.4. **Getter, Setter**
>클래스가 Private 변수를 가지고 있으면, 해당 변수에 대해 Getter와 Setter를 생성할 수 있습니다. Getter와 Setter의 이름은 보통 Private 변수명에서 _를 제거한 이름을 사용합니다. 프로그램에서 각각 클래스 필드의 값을 초기화하고 검색할 수 있습니다. 
>getter는 매개변수가 없고 값을 반환하고 setter는 매개변수가 하나만 있고 값을 반환하지 않습니다.
- getter: getter 또는 접근자는 get 키워드를 사용하여 정의됩니다.
```
Return_type  get identifier 
{ 
} 
```
- setter: setter 또는 mutator는 set 키워드를 사용하여 정의됩니다.
```
set identifier 
{ 
}
```

### 1.5. **상속((Inheritance))**
> 상속 받을 때에는 extends라는 키워드를 사용합니다. 하나의 클래스만 상속이 가능하며, 다중 상속을 지원하지 않습니다.
```
class child_class_name extends parent_class_name 
```
1.5.1. 상속 유형
- 단일: 모든 클래스는 기껏해야 하나의 상위 클래스에서 확장될 수 있습니다.
- Multiple: 한 클래스는 여러 클래스에서 상속할 수 있습니다. Dart는 다중 상속을 지원하지 않습니다.
- 다중 수준: 클래스는 다른 하위 클래스에서 상속할 수 있습니다.

### 1.6. **인터페이스(Interface)**
> Dart에서는 Interface라는 키워드 대신 class를 사용하여 인터페이스(Interface)를 정의할 수 있습니다. 인터페이스는 클래스를 정의할 때, 반드시 정의해야하는 변수와 함수를 지정할 때 사용합니다. 
> implements를 사용하여 구현합니다. 인스턴스 생성을 못하게 할 때는 abstract 키워드를 붙이고, 메소드 정의만 하도록 합니다.

## 2. Generics
> 제네릭을 사용하면 변수 타입을 명확하게 해줄 수 있고, 반복되는 코드를 줄일 수 있습니다. 대부분의 타입 변수에는 E, T, S, K, V와 같은 단일 문자입니다.
1. `Collection`: 여러 데이터를 모아놓은 데이터 자료구조
2. `Generic`: 콜렉션이 가지고 있는 여러 데이터들의 타입을 지정해 안정성을 확보하고 재사용성을 향상시키는 기법

<<<<<<< HEAD
###2.1. **Collection Literals(콜렉션 리터럴)**
=======
2.1. **Collection Literals(콜렉션 리터럴)**
>>>>>>> refs/remotes/origin/main
> List, Set, Map 선언 시 제네릭을 사용해 타입을 명확하게 명시 할 수 있습니다.

2.1.1. Example(사용 예)
```Dart
//List
var names = <String>["Mike", "Jack", "Alice", "Kate"];

//Set
var unqueNames = <String>{"Mike", "Jack", "Alice", "Kate"};

//Map
var profile = <String, String>{
    "name": "Mike",
    "age": "24",
    "checkId": "1",
    ...
}
```

<<<<<<< HEAD
###2.2. **Parameter types with constructor**
=======
2.2. **Parameter types with constructor**
>>>>>>> refs/remotes/origin/main
> 여러 타입 값을 파라미터로 전달받는 생성자를 하나의 함수로 만들 수 있습니다.

2.2.1. Example(사용 예)
```Dart
var nameSet = Set<String>.from(names);
var profile = Map<String, double>();
```

<<<<<<< HEAD
###2.3. **Generic collections and the types they contain**
=======
2.3. **Generic collections and the types they contain**
>>>>>>> refs/remotes/origin/main
> Dart 언어의 제네릭은 런타임 시 해당 타입의 정보가 사라지지 않습니다.

2.3.1. Example(사용 예)
```Dart
var names = List<String>();
names.addAll(["John", "Rui", "Bob", "Clark"]);
print(names is List<String>); //True
```

<<<<<<< HEAD
###2.4. **Restricting the parameterized type**
=======
2.4. **Restricting the parameterized type**
>>>>>>> refs/remotes/origin/main
> 제네릭 타입을 적용할 때 해당 클래스의 파라미터 타입을 `extends` 키워드를 통해 제한할 수 있습니다. 예로 java 문법에서는 런타임 시 제네릭 타입이 제거됩니다. 따라서 객체의 여부는 확인할 수 있지만, 타입은 알 수 없습니다. 

2.4.1. Example(사용 예)
```Dart
class A {
    ...
}

class B extends A{
    ...
}

class C<T extends A>{
    ...
}

void main() {
    ...
}
```

<<<<<<< HEAD
###2.5. **Using generic methods**
=======
2.5. **Using generic methods**
>>>>>>> refs/remotes/origin/main
> 클래스 뿐만 아니라 함수와 메소드에도 Restricting이 가능합니다.

2.5.1. Example(사용 예)
```Dart
T first<T>(List<T> ts) {
    ...
    T tmp = ts[0];
    ...
    return tmp;
}
```


# 어려웠던 부분
김은총: 없습니다.
김유진: 없습니다.

# 궁금한 부분
김은총: 없습니다.
김유진: 없습니다.

# 스터디 리뷰
김은총: class의 인스턴스가 다양해서 흥미로웠습니다.
김유진: 공식 문서의 내용이 만족스럽지 않아 약간의 인터넷 검색을 하게 되었는데요. 제네릭 활용 예를 더 찾아봐야할 것 같아요!
