# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants=Restaurant.create([
        {
          name:"Banh my ga mai",
          address:"Ngo 181 Nguyen Luong Bang",
          phone:"0123456784",
          description:"Ngon ngon ngon vo cung"
        },
        {
          name:"Banh ngon nha mo",
          address:"7 Trung Liet Quan Dong Da Ha Noi",
          phone:"01234888784",
          description:"Ngon ngon ngon cuc vo cung"
        },
        {
          name:"Che Tam Dung",
          address:"Kiot 2 cong sau Dai Hoc Thuy Loi",
          phone:"0123422284",
          description:"Ngon ngon ngon vo cung"
        },
        {
          name:"Mo Hue",
          address:"Tran Dai Nghia",
          phone:"0123456784",
          description:"Ngon ngon ngon vo cung"
        },
        {
          name:"ga mai",
          address:" Nguyen Luong Bang",
          phone:"01239996784",
          description:"Ngon ngon ngon den vo cung"
        },
    ])
users=User.create([
  {
    username:"Mai Hoa",
    email:"hoa@gmail.com",
    encrypted_password:"12345",
    birthday: DateTime.new(2009,9,1,17),
    address:"Ngoai thanh Ha Noi",
    phone:"09678655678",
    avatar:"hoa.img"
  },
    {
    username:"Khoa Nguyen",
    email:"khoa@gmail.com",
    encrypted_password:"12345",
    birthday: DateTime.new(2009,9,1,17),
    address:"Ngoai thanh Ha Noi",
    phone:"09678655678",
    avatar:"hoa.img"
  },
    {
    username:"Thanh Binh",
    email:"binh@gmail.com",
    encrypted_password:"12345",
    birthday: DateTime.new(2009,9,1,17),
    address:"Ngoai thanh Ha Noi",
    phone:"09678655678",
    avatar:"hoa.img"
  },
    {
    username:"Khoi Nguyen",
    email:"khoi@gmail.com",
    encrypted_password:"12345",
    birthday: DateTime.new(2009,9,1,17),
    address:"Ngoai thanh Ha Noi",
    phone:"09678655678",
    avatar:"hoa.img"
  },
    {
    username:"Pham Hang",
    email:"hang@gmail.com",
    encrypted_password:"12345",
    birthday: DateTime.new(2009,9,1,17),
    address:"Ngoai thanh Ha Noi",
    phone:"09678655678",
    avatar:"hoa.img"
  },
  ])
foods=Food.create([
    {
      name:"Pho",
      price:20,
      restaurant_id:1
    },
    {
      name:"Cơm Cuộn",
      price:15,
      restaurant_id:1
    },
    {
      name:"Gà Chiên Giòn",
      price:25,
      restaurant_id:1
    },
    {
      name:"Xôi Ngô",
      price:10,
      restaurant_id:1
    },
    {
      name:"Cơm đậu phụ",
      price:15,
      restaurant_id:1
    },
    {
      name:"Thịt bò hầm",
      price:30,
      restaurant_id:1
    },
    {
      name:"Bánh mì nướng",
      price:20,
      restaurant_id:2
    },{
      name:"Bánh xèo",
      price:20,
      restaurant_id:2
    },{
      name:"Bánh bột lọc",
      price:20,
      restaurant_id:2
    },
    
  ])
 Comment.create([
      {
        content:%{ ngon tuyệt đỉnh luôn.ngon dã man.
            },
        restaurant_id:1,
        user_id:3
      },
          {
        content:%{ ngon tuyệt đỉnh luôn.ngon dã man.
            },
        restaurant_id:2,
        user_id:2
      },
          {
        content:%{ ngon tuyệt đỉnh luôn.ngon dã man.
            },
        restaurant_id:1,
        user_id:1
      },
          {
        content:%{ dở tệ đến tệ hại.ko nuốt trôi.
            },
        restaurant_id:2,
        user_id:3
      },
    ])
  FoodImage.create([
      {
        image:"1.img",
        food_id:1
      },
      {
        image:"0.img",
        food_id:0
      },
      {
        image:"2.img",
        food_id:2
      },
      {
        image:"3.img",
        food_id:3
      },
      {
        image:"4.img",
        food_id:4
      },
      {
        image:"5.img",
        food_id:5
      },
      
    ])
 Vote.create([
    {
      start_num:3,
      user_id:1,
      restaurant_id:2
    },
     {
      start_num:4,
      user_id:2,
      restaurant_id:2
    },
     {
      start_num:1,
      user_id:1,
      restaurant_id:1
    },
     {
      start_num:5,
      user_id:2,
      restaurant_id:1
    },
     {
      start_num:3,
      user_id:3,
      restaurant_id:2
    }
  ])
Transaction.create([
    {
      price:123.5,
      restaurant_id:1
    },
     {
      price:303.5,
      restaurant_id:2
    },
    
  ])
ResImage.create([
    {
      image:"res1.img",
      restaurant_id:1
    },
     {
      image:"res2.img",
      restaurant_id:2
    },
    
  ])
