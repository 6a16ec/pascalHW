var
  file_input, file_output : text;
  chet, nechet, temp : integer;
 
const file_input_name = 'input.txt';
      file_output_name = 'output.txt';

begin
  chet := 0; nechet := 0;

  assignFile(file_input, file_input_name);
  assignFile(file_output, file_output_name);
  
  reset(file_input);
  
  while not EOF(file_input) do begin
    read(file_input, temp);
    if temp mod 2 = 0 then inc(chet)
    else inc(nechet);
  end;
  close(file_input);
  
  rewrite(file_output);
  write(file_output, nechet / (chet + nechet) * 100);
  close(file_output);

end.
