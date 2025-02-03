package demo.utils;

import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;
import java.util.Locale;


public class DateUtils {

    public static String localDate(String text) {
        Instant now = Instant.now();
        ZonedDateTime local = now.atZone(ZoneId.of("America/Los_Angeles"));
        return local.format(new DateTimeFormatterBuilder()
                .appendPattern(text)
                .appendText(ChronoField.AMPM_OF_DAY)
                .toFormatter(Locale.UK));
    }
}
