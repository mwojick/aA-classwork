const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

const questions = [
    "Why do we bake cookies, and cook bacon?\n",
    "What is the true meaning of life?\n",
    "Will 'Make Change' be on A05?\n"
];

// questions.forEach(question=> {
//     reader.question(question, (ans) => {
//         console.log(ans)
//     })
// })
// We want our reader to reach each question, and get an answer before moving onto the next question

//callback helllllllll
// reader.question(questions[0], (ans) => {
//     console.log(ans);
//     reader.question(questions[1], (ans) => {
//         console.log(ans);
//         reader.question(questions[2], (ans) => {
//             console.log(ans)
//         })
//     })
// })

function questionPromisified(question) {
    return new Promise((resolve, reject) => {
        reader.question(question, ans => resolve(ans))
    })
}

questionPromisified(questions[0])
    .then(data => {
        console.log(data);
        return questionPromisified(questions[1])
    })
    .then(data => {
        console.log(data);
        return questionPromisified(questions[2])
    })
    .then(data => {
        console.log(data);
        reader.close();
    })
