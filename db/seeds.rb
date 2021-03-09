# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES = ['Web development', 'Network', 'Artificial Intelligence', 'Internet Of Things', 'Startup',
              'Gaming', 'Hardware', 'Other'].freeze

CATEGORIES.each { |cat| Category.create(name: cat, priority: 0) }

10.times { |i| User.create(id: i, name: "User #{i + 1}") }

TITLES = ['Adipisicing quis nulla consequat cillum.', 'Labore excepteur Lorem quis velit cillum eiusmod eiusmod dolor est.', 'Enim ea sit consectetur exercitation elit ex in dolor ex laborum anim elit elit.', 'loremElit Lorem ullamco sunt fugiat sit culpa fugiat ut reprehenderit.'].freeze

TEXTS = ['Cupidatat ex est labore nulla sit consequat sint laborum deserunt et. Nisi do proident duis reprehenderit voluptate ipsum adipisicing esse labore Lorem cillum sint occaecat. Laborum commodo irure tempor do eiusmod sunt cillum non laborum incididunt qui aliqua mollit. Sit excepteur esse labore Lorem occaecat nisi et ullamco sint nulla. Sunt quis laboris enim culpa magna aliquip. Adipisicing eu nulla minim nulla dolor mollit enim qui dolore ad.', 'Ad deserunt exercitation consectetur deserunt veniam veniam mollit laborum quis irure sunt dolore est amet. Nisi aliqua adipisicing tempor amet consequat. Amet eiusmod eu commodo consequat Lorem. Ea ad nisi tempor ex. Deserunt non aliqua proident ipsum minim occaecat mollit irure reprehenderit anim exercitation elit.', 'Labore consequat ut mollit id in sint amet do do quis sit laboris duis irure. Qui ad aute quis cupidatat ullamco enim magna magna magna aliquip adipisicing sit. Exercitation Lorem aliquip reprehenderit enim non do cillum elit officia est.', 'Commodo dolor qui id officia aliquip duis. Consectetur amet in ad commodo qui consectetur. Pariatur nostrud aliquip dolor excepteur.']

IMAGES = ['https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2021/02/1-copy-61-796x417.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2021/02/ezgif-5-43327042c565-796x597.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2021/01/Screenshot-2021-01-21-at-15.29.36-796x469.png', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2021/01/GitHub-Iran-796x455.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/12/2021-796x417.png', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/12/Post1-Image1-796x448.png', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/12/GitHub-dark-mode-796x418.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/11/image2-1-796x344.png', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2018/03/GitHub-brave-hed-796x418.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/10/Untitled-design-15-796x417.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2018/10/GitHub-featured-796x428.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/10/39776596971_e2ab94f1db_k-796x531.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/10/Untitled-design-14-796x417.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/03/github-mobile-1200-630-796x418.png', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/10/image-2-2-1-796x448.png', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/09/tnw2020-fb_header-1920x1080-1-796x448.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/09/1-18-796x417.jpg', 'https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2020/09/Screenshot-2020-09-08-at-8.43.57-PM-e1599580066674-796x419.png'].freeze

