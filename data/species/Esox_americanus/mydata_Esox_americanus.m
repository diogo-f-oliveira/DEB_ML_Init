  function [data, auxData, metaData, txtData, weights] = mydata_Esox_americanus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Esocidae';
metaData.species    = 'Esox_americanus'; 
metaData.species_en = 'American pickerel'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 14]; 

%% set data
% zero-variate data
data.am = 5*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishesoftexas';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishesoftexas';
  comment.Lp = 'based on fact the TL 16 cm fish had few eggs';
data.Li = 38.1;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';

data.Wwb = 3.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = {'fishesoftexas','fishbase'};
  comment.Wwb = 'based on egg diameter of 1.9 mm: pi/6*0.19^3';
data.Wwp = 14.6;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwp = 'based on 0.00468*Lp^3.05, see F1';
data.Wwi = 311; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.05, see F1; fishbase gives 1 kg, which would correspond to TL 57 cm';
  
data.Ri = 4584/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate at TL 32.5 cm';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
  0 14.5
  1 20.8
  2 25.1
  3 28.7
  4 35.6];
data.tL(:,1) = (1.5 + data.tL(:,1)) * 365;  % convert year to d 
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};
temp.tL = C2K(11); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'fishesoftexas'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Facts 
F1 = 'length-weight: Ww in g = 0.00468 *(TL in cm)^3.05';	
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6H52H'; % Cat of Life
metaData.links.id_ITIS = '162140'; % ITIS
metaData.links.id_EoL = '207217'; % Ency of Life
metaData.links.id_Wiki = 'Esox_americanus'; % Wikipedia
metaData.links.id_ADW = 'Esox_americanus'; % ADW
metaData.links.id_Taxo = '42888'; % Taxonomicon
metaData.links.id_WoRMS = '1021987'; % WoRMS
metaData.links.id_fishbase = 'Esox-americanus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Esox_americanus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Esox-americanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/esox americanus.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

