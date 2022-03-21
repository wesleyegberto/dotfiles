# My Workflow Tools

## Content Manipulation

### CSV

Transform a CSV to JSON:

```bash
csvtojson --headers='["Header 1","Header 2"]' --delimiter=';' myfile.csv
```

CSV analyzing and manipulation with [xsv](https://github.com/BurntSushi/xsv):

```bash
xsv stats myfile.csv --everything | xsv table
```

## Tests

### Bench

Benchmark a command:

```bash
bench ls
```

Run a command:

```sh
stress_command 'curl http://httpbin.org/get' 10 1
```

**Apache Bench**

GET request:

```sh
ab_get_test http://httpbin.org/get 1000 10
```

POST request:

```sh
ab_post_test http://httpbin.org/post payload.json 5000 10
```

## Misc

Count the [LOC](https://github.com/cgag/loc):

```bash
loc --files src
```
