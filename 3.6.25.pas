var
  file_input, file_output : text;
  count, count_less, count_more, summ, i : integer;
  number_less, number_more, number_array : array [1..1000] of integer;
 
const file_input_name = 'input.txt';
      file_output_name = 'output.txt';

begin

  assignFile(file_input, file_input_name);
  assignFile(file_output, file_output_name);
  
  reset(file_input);
    
  i := 1; summ := 0;
  while not EOF(file_input) do begin
    read(file_input, number_array[i]);
    summ := summ + number_array[i];
    inc(i);
  end;
  
  close(file_input);
  count := i - 1;
  
  count_less := 1; count_more := 1;
  for i := 1 to count do begin
    if number_array[i] >= summ/count then begin
      number_more[count_more] := number_array[i];
      inc(count_more);
    end
    else begin
      number_less[count_less] := number_array[i];
      inc(count_less);
    end;
  end;
  
  count_less := count_less - 1; count_more := count_more - 1;
  
  
  
  rewrite(file_output);
  for i := 1 to count_more do write(file_output, number_more[i], ' ');
  writeln(file_output, '');
  for i := 1 to count_less do write(file_output, number_less[i], ' ');
  writeln(file_output, '');
  close(file_output);

end.
