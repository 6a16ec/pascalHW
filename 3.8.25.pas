var
  file_input, file_output : text;
  chet, nechet, temp, i, j, count, length_line, space_count: integer;
  line, line_new: string;
  point, start_sentence, end_sentence : boolean;
 
const file_input_name = 'input.txt';
      file_output_name = 'output.txt';

begin

  assignFile(file_input, file_input_name);
  assignFile(file_output, file_output_name);
  
  reset(file_input);
  
  if not EOF(file_input) then begin
    read(file_input, line);
  end;
  close(file_input);
  
  
  
  space_count := 0;
  length_line := length(line);
  
  i := 1;
  
  while i <= length(line) do begin
  
    if line[i] = ' ' then inc(space_count)
    else space_count := 0;
    
    if ((space_count > 1) or ((space_count = 1) and (i = 1)) or ((space_count = 1) and (i = length(line)))) then begin
      line := copy(line, 1, i-1) + copy(line, i + 1, length(line) - i + 1);
      dec(space_count);
      dec(length_line);
    end
    else inc(i);
    
  end;
  if line[length(line)] = ' ' then line := copy(line, 1, length(line) - 1);
  
  
  rewrite(file_output);
  write(file_output, line);
  close(file_output);

end.
