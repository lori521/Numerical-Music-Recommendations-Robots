function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    f = fopen(filename, 'r');

    % TODO 2: Read n, x, y from the file
    % se citeste n si se transforma in numar
    n = fgetl(f);
    n = str2double(n);

    % se citeste prima linie de unde se extrag valorile lui x
    line = fgetl(f);
    cnt = 1;
    while ~isempty(line)
        [tok, remain] = strtok(line);
        if isempty(tok)
            break;
        endif
        x(cnt) = str2double(tok);
        line = remain;
        cnt = cnt + 1;
    endwhile

    % se citeste a doua linie de unde se extrag valorile lui y
    line = fgetl(f);
    cnt = 1;
    while ~isempty(line)
        [tok, remain] = strtok(line);
        if isempty(tok)
            break;
        endif
        y(cnt) = str2double(tok);
        line = remain;
        cnt = cnt + 1;
    endwhile

    % TODO 3: Close the file
    fclose(f);
end