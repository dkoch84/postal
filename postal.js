#!/usr/sbin/node
const fs = require('fs')

fs.readFile(__dirname + '/jobs/job1.json', 'utf8', (err, data) => {
    if (err) {
        console.error(err)
        return
    }
    console.log(JSON.parse(data))
    console.log(JSON.parse(data).Run.Stats.Requests)
    console.log(JSON.parse(data).Run.Stats.Assertions)
    console.log(JSON.parse(data).Run.Timings)
})