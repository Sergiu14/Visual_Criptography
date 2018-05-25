function matrix=generateMatrix(nrShares,m)
    
    %nrShares=str2num(nrShares);

    for i=1:1:nrShares
       for j=1:1:nrShares
           S0(i,j)=0;
           S1(i,j)=0;
       end
    end
    for i=1:1:nrShares
          S0(i,nrShares)=1;
          S1(i,i)=1;
    end
    
    
    
    matrix=[S0 S1];
    
    
 
end

