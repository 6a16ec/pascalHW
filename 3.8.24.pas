var
  file_input, file_output : text;
  chet, nechet, temp, i, j, count, length_line: integer;
  line, line1 : string;
  point, start_sentence, end_sentence : boolean;
 
const file_input_name = 'input.txt';
      file_output_name = 'output.txt';

begin

  assignFile(file_input, file_input_name);
  assignFile(file_output, file_output_name);
  
  reset(file_input);
  
  if not EOF(file_input) then begin
    read(file_input, line);
    //line := copy(line, 1, 5-1) + ' ' + copy(line, 5, length(line));
//    writeln(line);
  end;
  close(file_input);
  
  start_sentence := true;
  end_sentence := false;
  length_line := length(line);
  
  i := 1;
  
  while i <= length_line do begin
  
    if start_sentence then begin
      if (ord(line[i]) >= ord('A')) and (ord(line[i]) <= ord('Z')) then line[i] := chr(ord(line[i]) + (ord('a') - ord('A')));
      if (ord(line[i]) >= ord('А')) and (ord(line[i]) <= ord('Я')) then line[i] := chr(ord(line[i]) + (ord('а') - ord('А')));
      
      
      if((ord(line[i]) >= ord('a')) and (ord(line[i]) <= ord('z')) or (ord(line[i]) >= ord('а')) and (ord(line[i]) <= ord('я'))) then start_sentence := false;
    end;
  
    if end_sentence then begin
      if line[i] <> ' ' then begin
        line := copy(line, 1, i-1) + ' ' + copy(line, i, length(line) - i + 1);
        inc(length_line)
      end;
      
      end_sentence := false;
      start_sentence := true;
    end;
    
    if line[i] = '.' then end_sentence := true;
    inc(i);

  end;
  
  
  rewrite(file_output);
  write(file_output, line);
  close(file_output);

end.
