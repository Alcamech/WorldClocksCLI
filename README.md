# World Clocks CLI Tool

This is a command-line tool that allows you to configure world clocks and display them on command. With this tool, you can quickly check the time in different time zones without leaving your terminal.

## Requirements
This script requires Bash and the `date` command to be installed on your system.

## Usage

To display the time in one or more time zones, simply run the script with the name of the time zones as arguments:

```
./world_clocks.sh America/New_York Europe/London Asia/Tokyo
```

You can also use the `-l` or `--list` option to display a list of all available time zones and select one or more to display:

```
./world_clocks.sh -l
```

## Options

The following options are available:

- `-h`, `--help`: Show the help message and exit.
- `-l`, `--list`: List all available time zones and select one or more to display.

## Time of Day

The script also displays the time of day in the selected time zone, which can be one of the following:

- MORNING: from 5:00 to 11:59
- DAYTIME: from 12:00 to 17:59
- EVENING: from 18:00 to 21:59
- NIGHTTIME: from 22:00 to 4:59

## License

This project is licensed under the MIT License. Feel free to use, modify, and distribute it as you like.
