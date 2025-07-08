function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_tawilis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_tawilis'; 
metaData.species_en = 'Freshwater sardinella'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 17];

%% set data
% zero-variate data;

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 7.6;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 12; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
data.Wwp = 4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwip= 'based on 0.00851*Lp^3.03, see F1';
data.Wwi = 15.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.03, see F1';

data.Ri  = 24582/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [ ... % time since birth (d), total length (cm)
365+283.550	10.180
365+316.991	10.110
365+345.589	10.462
730+11.950	10.602
730+41.252	10.813
730+74.671	10.884
730+97.777	11.446
730+129.149	11.516
730+165.331	11.376
730+260.743	12.009
730+317.336	12.220
730+344.569	12.571]; 
data.tL(:,1) = data.tL(:,1)+20; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MutiMuyo2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XMKN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '204825'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_tawilis'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_tawilis'; % ADW
metaData.links.id_Taxo = '204825'; % Taxonomicon
metaData.links.id_WoRMS = '1016224'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-tawilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_tawilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MutiMuyo2017'; type = 'Article'; bib = [ ...
'doi = {10.31398/tpjf/25.1.2017C0017}, '...
'author = {Maria Theresa M. Mutia and Myla C. Muyot and Francisco B. Torres and Charice M. Faminialagao}, ' ... 
'year = {2017}, ' ...
'title = {Status of Taal Lake Fishery Resources with Emphasis on the Endemic Freshwater Sardine, \emph{Sardinella tawilis} ({H}erre, 1927)}, ' ...
'journal = {The Philippine Journal of Fisheries}, ' ...
'volume = {24(1-2)}, ' ...
'pages = {128-135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {https://www.fishbase.de/summary/Sardinella-tawilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
