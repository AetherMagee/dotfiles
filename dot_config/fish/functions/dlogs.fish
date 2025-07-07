function dlogs --wraps='docker logs -f -n 100' --description 'alias dlogs=docker logs -f -n 100'
  docker logs -f -n 100 $argv
        
end
