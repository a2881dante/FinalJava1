create table IF NOT EXISTS kanji_classes
(
    id   bigint auto_increment primary key,
    name varchar(255) null
);

INSERT IGNORE INTO `kanji_classes` (`id`, `name`)
VALUES
    (1, 'Первый класс ' ),
    (2, 'Второй класс ' );

create table IF NOT EXISTS kanjies
(
    id       bigint auto_increment primary key,
    kun_read varchar(50)  null,
    meaning     varchar(100) null,
    on_read  varchar(50)  null,
    sign     varchar(255) null,
    class_id bigint       null,
    constraint FKg6m5nsoyl7ywagt2rnb3gt60e foreign key (class_id) references kanji_classes (id)
);

INSERT IGNORE INTO `kanjies` (`id`, `sign`, `meaning`, `on_read`, `kun_read`, `class_id`)
VALUES
    (1, '一', 'один', 'ицу, хито-цу', 'ити', 1),
    (2, '二', 'два', 'ни', 'фута-цу', 1),
    (3, '三', 'три', 'сан', 'ми-цу', 1),
    (4, '四', 'четыре', 'си', 'ё-цу, ён', 1),
    (5, '五', 'пять', 'го', 'ицу-цу', 1),
    (6, '六', 'шесть', 'року', 'му-цу', 1),
    (7, '七', 'семь', 'сити', 'нана-цу', 1),
    (8, '八', 'восемь', 'хати', 'я-цу', 1),
    (9, '九', 'девять', 'ку, кю:', 'коконо-цу', 1),
    (10, '十', 'десять', 'дзю:', 'то', 1),
    (11, '百', 'сто', 'хяку', 'момо', 1),
    (12, '千', 'тысяча', 'сэн', 'ти', 1),
    (13, '上', 'верх, над', 'сё:, дзё:', 'а-гару, уэ', 1),
    (14, '下', 'низ, под', 'ка, гэ', 'сита, куда-ру', 1),
    (15, '左', 'левый', 'са', 'хидари', 1),
    (16, '右', 'правый', 'у, ю:', 'миги', 1),
    (17, '中', 'середина, внутри', 'тю:, дзё:', 'нака', 1),
    (18, '大', 'большой', 'тай, дай', 'оо-кий', 1),
    (19, '小', 'маленький', 'сё:', 'тии-сай', 1),
    (20, '月', 'месяц, луна', 'гацу, гэцу', 'цуки', 1),
    (21, '日', 'день, солнце', 'нити, дзицу', 'хи, ка', 1),
    (22, '年', 'год', 'нэн', 'тоси', 1),
    (23, '早', 'ранний, рано, быстро', 'со:', 'хая-и', 1),
    (24, '木', 'дерево', 'моку, боку', 'ки, ко', 1),
    (25, '林', 'роща', 'рин', 'хаяси', 1),
    (26, '山', 'гора', 'сан', 'яма', 1),
    (27, '川', 'река', 'сэн', 'кава', 1),
    (28, '土', 'земля, грунт', 'то, до', 'цути', 1),
    (29, '空', 'небо, пустота', 'ку:', 'сора, кара', 1),
    (30, '田', 'рисовое поле', 'дэн', 'та, да', 1),
    (31, '天', 'небеса', 'тэн', '', 1),
    (32, '生', 'жизнь', 'сэй, сё:', 'и-киру, у-му, нама', 1),
    (33, '花', 'цветок', 'ка', 'хана', 1),
    (34, '草', 'трава', 'со:', 'куса',1),
    (35, '虫', 'насекомое', 'тю:', 'муси', 1),
    (36, '犬', 'собака', 'кэн', 'ину', 1),
    (37, '人', 'человек', 'дзин, нин', 'хито', 1),
    (38, '名', 'имя', 'мэй, мё:', 'на', 1),
    (39, '女', 'женщина', 'дзё:, нё', 'онна', 1),
    (40, '男', 'мужчина', 'дан, нан', 'отоко', 1),
    (41, '子', 'ребёнок', 'су, си', 'ко', 1),
    (42, '目', 'глаз', 'боку, моку', 'мэ', 1),
    (43, '耳', 'ухо', 'дзи', 'мими', 1),
    (44, '口', 'рот', 'ко:,　ку', 'кути', 1),
    (45, '手', 'рука', 'сю', 'тэ', 1),
    (46, '足', 'нога', 'соку', 'аси', 1),
    (47, '見', 'видеть', 'кэн', 'ми-ру', 1),
    (48, '音', 'звук', 'он, ин', 'нэ, ото',1),
    (49, '力', 'сила, мощь', 'рики, рёки', 'тикара',1),
    (50, '気', 'духовная сила, дух, воздух, пар, призрак', 'ки, ку', 'ики', 1),
    (51, '円', 'иена, круглый', 'эн', 'мару-й', 1),
    (52, '入', 'входить', 'ню:', 'хаи-ру, и-ру', 1),
    (53, '出', 'выходить', 'сюцу, суй', 'дэ-ру', 1),
    (54, '立', 'стоять, вставать', 'рицу, рю:', 'та-цу', 1),
    (55, '休', 'отдых, отдыхать', 'кю:', 'ясу-му', 1),
    (56, '先', 'впереди, прежний, предыдущий', 'сэн', 'саки', 1),
    (57, '夕', 'вечер', 'сэки', 'ю:', 1),
    (58, '本', 'книга, основа', 'хон', 'мото', 1),
    (59, '文', 'текст', 'бун, мон', 'фуми', 1),
    (60, '字', 'буква, знак', 'дзи', 'адзана', 1),
    (61, '学', 'наука, учить, учиться', 'гаку', 'мана-бу', 1),
    (62, '校', 'школа', 'ко:', '', 1),
    (63, '村', 'деревня', 'сон', 'мура', 1),
    (64, '町', 'город (малый)', 'тё:', 'мати', 1),
    (65, '森', 'лес', 'син', 'мори', 1),
    (66, '正', 'верный, правильный', 'сэё, сё:', 'тада-сий', 1),
    (67, '水', 'вода', 'суй', 'мидзу', 1),
    (68, '火', 'огонь', 'ка', 'хи', 1),
    (69, '玉', 'драгоценный камень', 'гёку', 'тама', 1),
    (70, '王', 'правитель', 'о:', 'кими', 1),
    (71, '石', 'камень', 'сэки, сяку, коку', 'иси', 1),
    (72, '竹', 'бамбук', 'тику', 'такэ', 1),
    (73, '糸', 'нитка', 'си', 'ито', 1),
    (74, '貝', 'ракушка', 'бай', 'кай', 1),
    (75, '車', 'машина', 'ся', 'курума', 1),
    (76, '金', 'золото', 'кин, кон', 'канэ', 1),
    (77, '雨', 'дождь', 'у', 'амэ', 1),
    (78, '赤', 'красный', 'сэки, сяку', 'ака', 1),
    (79, '青', 'синий', 'сэй, сё:', 'ао', 1),
    (80, '白', 'белый', 'хаку, хяку', 'сиро', 1),
    (81, '数', 'цифра', 'су:', 'кадзу', 2),
    (82, '多', 'много', 'та', 'о:-й', 2),
    (83, '少', 'мало, немного', 'сё:', 'суку-най, суко-си', 2),
    (84, '万', 'десять тысяч', 'ман', 'ёродзу', 2),
    (85, '半', 'половина', 'хан', 'нака-ба', 2),
    (86, '形', 'форма, образ', 'кэй, гё:', 'катати', 2),
    (87, '太', 'толстый, жирный', 'та', 'футо-й', 2),
    (88, '細', 'тонкий', 'саи', 'хосо-й', 2),
    (89, '広', 'широкий', 'ко:', 'хиро-й', 2),
    (90, '長', 'длинный, начальник', 'тё:', 'нага-й', 2),
    (91, '点', 'точка', 'тэн', 'боти', 2),
    (92, '丸', 'круг', 'ган', 'мару', 2),
    (93, '交', 'обмениваться, пересекаться, встречаться', 'ко:', 'мадзи-вару', 2),
    (94, '光', 'свет, сияние', 'ко:', 'хикари', 2),
    (95, '角', 'угол', 'каку', 'кадо, цуно, суми', 2),
    (96, '計', 'измерять, подсчитывать', 'кэи', 'хака-ру', 2),
    (97, '直', 'прямой, исправлять, чинить', 'тёку, дзики', 'тада-ти, нао-су', 2),
    (98, '線', 'линия', 'сэн', 'судзи', 2),
    (99, '矢', 'стрела', 'си', 'я', 2),
    (100, '弱', 'слабый', 'дзяку', 'ёва-й', 2),
    (101, '強', 'сильный', 'кё:', 'цуё-й', 2),
    (102, '高', 'высокий, дорогой', 'ко:', 'така-й', 2),
    (103, '同', 'одинаковый, такой же', 'до:', 'она-дзи', 2),
    (104, '親', 'родители', 'син', 'оя', 2),
    (105, '母', 'мать', 'бо', 'хаха, каа', 2),
    (106, '父', 'отец', 'фу', 'тити, то:', 2),
    (107, '姉', 'старшая сестра', 'си', 'анэ', 2),
    (108, '兄', 'старший брат', 'кэи', 'ани', 2),
    (109, '弟', 'младший брат', 'тэи, даи', 'ото:то', 2),
    (110, '妹', 'младшая сестра', 'маи', 'имо:то', 2),
    (111, '自', 'сам, лично', 'дзи, си', 'мидзука-ра', 2),
    (112, '友', 'друг', 'ю:', 'томо', 2),
    (113, '体', 'тело', 'таи', 'карада', 2),
    (114, '毛', 'шерсть, волос', 'мо:', 'кэ', 2),
    (115, '頭', 'голова, глава', 'то:', 'атама', 2),
    (116, '顔', 'лицо', 'ган', 'као', 2),
    (117, '首', 'шея', 'сю', 'куби', 2),
    (118, '心', 'сердце, душа, чувства', 'син', 'кокоро', 2),
    (119, '時', 'время', 'дзи', 'токи', 2),
    (120, '曜', 'день недели', 'ё:', '', 2),
    (121, '朝', 'утро', 'тё:', 'аса', 2),
    (122, '昼', 'дневное время, обед', 'тю:', 'хиру', 2),
    (123, '夜', 'ночь', 'я', 'ёру', 2),
    (124, '分', 'минута, доля, понимать', 'фун, бун', 'ва-кару', 2),
    (125, '週', 'неделя', 'сю:', '', 2),
    (126, '春', 'весна', 'сюн', 'хару', 2),
    (127, '夏', 'лето', 'ка', 'нацу', 2),
    (128, '秋', 'осень', 'сю', 'аки', 2),
    (129, '冬', 'зима', 'то:', 'фую', 2),
    (130, '今', 'сейчас, теперь', 'кон', 'има', 2),
    (131, '新', 'новый', 'син', 'атара-сий', 2),
    (132, '古', 'старый, древний', 'ко', 'фуру-й', 2),
    (133, '間', 'промежуток, интервал, между', 'кан, кэн', 'ма, айда', 2),
    (134, '方', 'сторона, направление', 'хо:', 'ката', 2),
    (135, '北', 'север', 'хоку', 'кита', 2),
    (136, '南', 'юг', 'нан', 'минами', 2),
    (137, '東', 'восток', 'то:', 'хигаси, адзума', 2),
    (138, '西', 'запад', 'сэй, сай', 'ниси', 2),
    (139, '遠', 'далекий', 'эн', 'то:-й', 2),
    (140, '近', 'близкий', 'кин', 'тикай', 2),
    (141, '前', 'перед', 'дзэн', 'маэ', 2),
    (142, '後', 'потом, после, позади, сзади', 'го, ко:', 'ноти, усиро, ато', 2),
    (143, '内', 'внутри', 'най', 'ути', 2),
    (144, '外', 'вне, снаружи, иной', 'гай, гэ', 'сото, хока, хадзусу', 2),
    (145, '場', 'место', 'дзё:', 'ба', 2),
    (146, '地', 'земля, почва', 'ти, дзи', '', 2),
    (147, '国', 'страна', 'коку', 'куни', 2),
    (148, '園', 'сад', 'эн', 'соно', 2),
    (149, '谷', 'долина', 'коку', 'тани', 2),
    (150, '野', 'поле', 'я', 'но', 2),
    (151, '原', 'луг', 'гэн', 'хара', 2),
    (152, '里', 'родная деревня, родина, мера длины', 'ри', 'сато', 2),
    (153, '市', 'город (крупный)', 'си', 'ити', 2),
    (154, '京', 'столица', 'кё:, кэй', 'мияко', 2),
    (155, '風', 'ветер', 'фу:', 'кадзэ', 2),
    (156, '雪', 'снег', 'сэцу', 'юки', 2),
    (157, '雲', 'облако, туча', 'ун', 'кумо', 2),
    (158, '池', 'пруд, водоём', 'ти', 'икэ', 2),
    (159, '海', 'море', 'кай', 'уми', 2),
    (160, '岩', 'скала', 'ган', 'ива', 2),
    (161, '星', 'звезда', 'сэй', 'хоси', 2),
    (162, '室', 'комната, теплица', 'сицу', 'муро', 2),
    (163, '戸', 'дверь, ставня', 'ко', 'то, бэ', 2),
    (164, '家', 'дом (свой), здание', 'ка, кэ', 'иэ', 2),
    (165, '寺', 'буддийский храм', 'дзи', 'тэра', 2),
    (166, '通', 'проходить, проезжать', 'цу', 'то:-ру', 2),
    (167, '門', 'ворота', 'мон', 'кадо', 2),
    (168, '道', 'дорога', 'до:', 'мити', 2),
    (169, '話', 'говорить, разговор, беседа', 'ва', 'ханаси, хана-су', 2),
    (170, '言', 'слово, говорить', 'гэн, гон', 'и-у, кото', 2),
    (171, '答', 'ответ, отвечать', 'то:', 'кота-эру', 2),
    (172, '声', 'голос', 'сэй', 'коэ', 2),
    (173, '聞', 'слышать', 'бун, мон', 'ки-ку', 2),
    (174, '語', 'язык, речь, говорить, рассказывать', 'го', 'ката-ру', 2),
    (175, '読', 'читать', 'доку', 'ё-му', 2),
    (176, '書', 'писать', 'сё', 'каку', 2),
    (177, '記', 'записывать', 'ки', 'сиру-су', 2),
    (178, '紙', 'бумага', 'си', 'ками', 2),
    (179, '画', 'картина, план', 'га, каку', '', 2),
    (180, '絵', 'картина, рисунок', 'кай', 'э', 2),
    (181, '図', 'план, карта', 'дзу', 'хака-ру', 2),
    (182, '工', 'рабочий, строитель, техника', 'ко:, ку', '', 2),
    (183, '教', 'учить, преподавать, объяснять', 'кё:', 'оси-эру', 2),
    (184, '晴', 'ясная погода', 'сэй', 'харэ', 2),
    (185, '思', 'думать', 'си', 'омо-у', 2),
    (186, '考', 'размышлять, полагать', 'ко:', 'канга-эру', 2),
    (187, '知', 'знание, знать', 'ти', 'си-ру', 2),
    (188, '才', 'талант, дарование', 'сай, дзай', 'вадзукани, дзаэ', 2),
    (189, '理', 'аргумент, довод, принцип', 'ри', 'котовари', 2),
    (190, '算', 'вычислять', 'сан', '', 2),
    (191, '作', 'создавать, делать', 'саку', 'цуку-ру', 2),
    (192, '元', 'начало, основание', 'гэн, ган', 'мото', 2),
    (193, '食', 'еда, есть', 'сёку', 'табэ-ру, ку-у', 2),
    (194, '肉', 'мясо', 'нику', '', 2),
    (195, '馬', 'лошадь', 'ба', 'ума, ма', 2),
    (196, '牛', 'корова', 'гю:', 'уси', 2),
    (197, '魚', 'рыба', 'гё', 'уо, сакана', 2),
    (198, '鳥', 'птица', 'тё:', 'тори', 2),
    (199, '羽', 'перо', 'у', 'ха, ханэ', 2),
    (200, '鳴', 'чирикать', 'мэй', 'на-ку', 2),
    (201, '麦', 'хлебные злаки', 'баку', 'муги', 2),
    (202, '米', 'рис', 'бэй, май', 'комэ', 2),
    (203, '茶', 'чай', 'тя, са', '', 2),
    (204, '色', 'цвет', 'сёку', 'иро', 2),
    (205, '黄', 'жёлтый', 'о:', 'ки', 2),
    (206, '黒', 'чёрный', 'коку', 'куро', 2),
    (207, '来', 'приходить, прибывать', 'раи', 'ку-ру', 2),
    (208, '行', 'идти, ходить, совершать', 'ко:, гё:', 'и-ку, ю-ку, оконау', 2),
    (209, '帰', 'возвращаться', 'ки', 'каэ-ру', 2),
    (210, '歩', 'шагать, ходить, идти', 'хо', 'ару-ку, аю-му', 2),
    (211, '走', 'бежать', 'со:', 'хаси-ру', 2),
    (212, '止', 'остановиться', 'си', 'то-мару', 2),
    (213, '活', 'живой, активный', 'кацу', 'и-киру', 2),
    (214, '店', 'магазин', 'тэн', 'мисэ, я', 2),
    (215, '買', 'покупать', 'бай', 'ка-у', 2),
    (216, '売', 'продавать', 'бай', 'у-ру', 2),
    (217, '午', 'полдень, лошадь (7 знак китайского гороскопа)', 'го', 'ума', 2),
    (218, '汽', 'пар', 'ки', '', 2),
    (219, '弓', 'лук (оружие)', 'кю:', 'юми', 2),
    (220, '回', 'раз (при счёте), вращать', 'кай', 'мава-ру', 2),
    (221, '会', 'встреча, встречаться, видеться', 'кай, э', 'а-у', 2),
    (222, '組', 'группа, класс', 'со', 'куми', 2),
    (223, '船', 'судно, лодка', 'сэн', 'фунэ', 2),
    (224, '明', 'ясный, светлый', 'мэи', 'ака-руй', 2),
    (225, '社', 'фирма, святилище', 'ся', 'ясиро', 2),
    (226, '切', 'резать, рубить', 'сэцу', 'ки-ру', 2),
    (227, '電', 'электричество', 'дэн', '', 2),
    (228, '毎', 'каждый', 'май', '', 2),
    (229, '合', 'соединять, подходить', 'го:', 'а-у', 2),
    (230, '当', 'данный, попадать, удаваться', 'то:', 'а-тару', 2),
    (231, '台', 'подставка', 'дай, тай', '', 2),
    (232, '楽', 'наслаждение, веселье', 'раку', 'тано-сий', 2),
    (233, '公', 'общественный, публичный', 'ко:', 'о:якэ', 2),
    (234, '引', 'тянуть', 'ин', 'хику', 2),
    (235, '科', 'отделение', 'ка', '', 2),
    (236, '歌', 'песня', 'ка', 'ута', 2),
    (237, '刀', 'меч', 'то:', 'катана', 2),
    (238, '番', 'очередь, черёд', 'бан', '', 2),
    (239, '用', 'использовать', 'ё:', 'моти-иру', 2),
    (240, '何', 'что', 'ка', 'нани, нан', 2);