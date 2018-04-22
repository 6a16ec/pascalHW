var
  file_input, file_output : text;
  m, i, j, n, a1, a2, count : integer;
  number_array : array [1..1000] of integer;
 
const file_input_name = 'input.txt';
      file_output_name = 'output.txt';

begin

  assignFile(file_input, file_input_name);
  assignFile(file_output, file_output_name);
  
  reset(file_input);
  
  read(file_input, m);
  
  i := 1;
  while not EOF(file_input) do begin
    read(file_input, number_array[i]);
    inc(i);
  end;
  
  close(file_input);
  count := i - 1;
  
  
  for j := 1 to count - 1 do begin
    for n := j + 1 to count do begin
      if number_array[j] + number_array[n] = m then begin
        a1 := number_array[j]; a2 := number_array[n];
      end;
    end;
  end;
  
  
  
  rewrite(file_output);
  write(file_output, a1, ' ', a2);
  close(file_output);

end.
