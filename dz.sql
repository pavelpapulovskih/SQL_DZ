-- Функция для преобразования секунд в дни, часы, минуты, секунды
CREATE OR REPLACE FUNCTION format_seconds(seconds INT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
  days INT;
  hours INT;
  minutes INT;
  remaining_seconds INT;
BEGIN
  days := floor(seconds / (24 * 3600));
  remaining_seconds := seconds % (24 * 3600);
  hours := floor(remaining_seconds / 3600);
  remaining_seconds := remaining_seconds % 3600;
  minutes := floor(remaining_seconds / 60);
  remaining_seconds := remaining_seconds % 60;

  RETURN days || ' days ' || hours || ' hours ' || minutes || ' minutes ' || remaining_seconds || ' seconds ';
END;
$$;

-- Вывод чётных чисел от 1 до 10
SELECT i FROM generate_series(2, 10, 2) AS i;

-- Пример использования функции format_seconds
SELECT format_seconds(123456);