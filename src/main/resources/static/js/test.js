var currentKanji = 0,
    learningStage = 1,
    testArr = [],
    testingKanji,
    successCount = 13,
    isAnswered = false;

init();

$('#next').on('click', function() {
    switch (learningStage){
        case 1:
            showKanji();
            break;
        case 2:
            if(successCount < testArr.length * 3) {
                showTestQuestion();
            } else {
                $("#complete_form").submit();
            }
            break;
    }
});

function init() {
    $("#learn_block").show();
    $('#res_error').hide();
    $('#res_success').hide();
    $('#war_no_repeat').hide();
    $('#war_no_learn').hide();
    if(arrKanjies.length == 0) {
        if(saveMode == "upd") {
            $('#war_no_repeat').show();
        } else {
            $('#war_no_learn').show();
        }
        $('#next').hide();
        return;
    }
    showKanji(arrKanjies[currentKanji]);
    arrKanjies.forEach(function(item) {
        testArr.push({
            kanji: item,
            testSuccessCount: 0,
        });
    });
    var kanjiesIds = arrKanjies.map(item => item.id).join("|")
    $("input[name=ids]").val(kanjiesIds);
    $("input[name=save_mode]").val(saveMode);
}

function showKanji(){
    $("#learn_block").show();
    let kanji = arrKanjies[currentKanji];
    $("#kanji_sign").html(kanji.sign);
    $("#kanji_card").html(`
            Он-ное чтение: <strong>${kanji.on_read}</strong>
            <br>
            Кун-ное чтение: <strong>${kanji.kun_read}</strong>
        `);
    $("#kanji_meaning").html(kanji.meaning);
    currentKanji++;
    if(currentKanji === arrKanjies.length) {
        learningStage = 2;
    }
}

function showTestQuestion() {
    $('#next').hide();
    $('#res_error').hide();
    $('#res_success').hide();
    isAnswered = false;
    $("#learn_block").hide();
    $("#test_block").show();
    testingKanji = testArr.filter((item) => item.testSuccessCount < 3)
        .sort(() => (Math.random() > .5) ? 1 : -1)[0].kanji;
    var answersArr = [];
    answersArr.push(testingKanji);
    let shuffledArr = arrKanjies.filter((item) => item.id != testingKanji.id)
        .sort(() => (Math.random() > .5) ? 1 : -1);
    for(i = 0; i < 3; i++) {
        answersArr.push(shuffledArr[i]);
    }

    let testType = Math.floor(Math.random() * 2);
    switch (testType) {
        // case 0:
        //     testReading(answersArr);
        //     break;
        case 0:
            testSign(answersArr);
            break;
        default:
            testMeaning(answersArr);
            break;
    }

    $('.answer-option').on('click', function(e) {
        var id = $(e.currentTarget).attr("val");
        console.log(id);
        if( !isAnswered ) {
            if (id == testingKanji.id) {
                $("#res_success").show();
                testArr
                    .find(item => item.kanji.id == testingKanji.id)
                    .testSuccessCount++;
                successCount++;

            } else {
                $("#res_error").show();
            }
            isAnswered = true;
            $('#next').show();
        }
    });
}

function testReading(arr) {
    $("#question").html(`Он-ное чтение: <strong>${testingKanji.on_read}</strong>
            <br>
            Кун-ное чтение: <strong>${testingKanji.kun_read}</strong>`);
    $("#answer_options").html("");
    arr.sort(() => (Math.random() > .5) ? 1 : -1).forEach(
        (item) => $("#answer_options")
            .append(`<button class='answer-option btn btn-primary' val="${item.id}">${item.sign}</button><br><br>`)
    );
}

function testSign(arr) {
    $("#question").html(`${testingKanji.meaning}`);
    $("#answer_options").html("");
    arr.sort(() => (Math.random() > .5) ? 1 : -1).forEach(
        (item) => $("#answer_options")
            .append(`<button class='answer-option btn btn-primary' val="${item.id}">${item.sign}</button><br><br>`)
    );
}

function testMeaning(arr) {
    $("#question").html(`${testingKanji.sign}`);
    $("#answer_options").html("");
    arr.sort(() => (Math.random() > .5) ? 1 : -1).forEach(
        (item) => $("#answer_options")
            .append(`<button class='answer-option btn btn-primary' val="${item.id}">${item.meaning}</button><br><br>`)
    );
}
