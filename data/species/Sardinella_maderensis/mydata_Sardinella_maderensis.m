function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_maderensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_maderensis'; 
metaData.species_en = 'Madeiran sardinella'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 09];

%% set data
% zero-variate data;

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'WehyAmpo2017';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 13.4;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 30; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm: pi/6*0.25^3';
data.Wwp = 21.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00813*Lp^3.03, see F1';
data.Wwi = 243;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 927 g; based on 0.00813*Li^3.03, see F1, gives 243 g';

data.Ri  = 82600/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fao';  
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (d), total length (cm)
365+135.258	10.569
365+170.198	10.569
730+109.062	19.499
730+135.511	20.774
730+169.756	22.688
730+194.171	23.690
730+222.666	23.599
1095+108.644	28.884
1095+170.368	30.433
1095+194.115	30.251
1095+222.604	30.979
1460+109.952	34.624
1460+170.334	34.533
1460+193.737	34.806
1825+109.590	37.267
1825+169.966	37.904];
data.tL(:,1) = data.tL(:,1)-250; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WehyAmpo2017';
comment.tL = 'based on length-frequency data';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XMLV'; % Cat of Life
metaData.links.id_ITIS = '161767'; % ITIS
metaData.links.id_EoL = '63620415'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_maderensis'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_maderensis'; % ADW
metaData.links.id_Taxo = '186548'; % Taxonomicon
metaData.links.id_WoRMS = '126423'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-maderensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_maderensis}}';
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
bibkey = 'WehyAmpo2017'; type = 'Article'; bib = [ ... 
'doi = {10.4172/2150-3508.1000189}, ' ...
'author = {Wehye, A.S. and Amponsah, S.K.K. and Jueseah, A.S.}, ' ... 
'year = {2017}, ' ...
'title = {Growth, Mortality and Exploitation of \emph{Sardinella maderensis} ({L}owe, 1838) in the {L}iberian coastal waters}, ' ...
'journal = {Fisheries and Aquaculture Journal}, ' ...
'volume = {8(1)}, ' ...
'pages = {1--33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sardinella-maderensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fao.org/3/n8488e/n8488e05.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  
