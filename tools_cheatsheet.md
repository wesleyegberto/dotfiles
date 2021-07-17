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

## Misc

Count the [LOC](https://github.com/cgag/loc):

```bash
loc --files src
```