function [data, auxData, metaData, txtData, weights] = mydata_Cyclopsetta_querna

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cyclopsettidae';
metaData.species    = 'Cyclopsetta_querna'; 
metaData.species_en = 'Toothed flounder'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K

metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 31];

%% set data
% zero-variate data;

data.ab = 9;      units.ab = 'd';      label.ab = 'time at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(26.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';        
data.am = 7*365;       units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature';        
  
data.Lp  = 21;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 43.2;    units.Li  = 'cm';   label.Li  = 'ultimate total lenght for females';    bibkey.Li  = 'fishbase';
data.Lim  = 39;    units.Lim  = 'cm';   label.Lim  = 'ultimate total lenght for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 5.24e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Cyclopsetta_chittendeni: pi/6*0.1^3';
data.Wwp = 115;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = '0.00891*Lp^3.11, see F1';
data.Wwi = 1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = '0.00891*Li^3.11, see F1';

data.Ri  = 2.1e5/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
 temp.Ri = C2K(26.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = 'based on kap=0.8'; 
  
% uni-variate data

% time-length
data.tL_fm = [ ... % month (#), total length (cm)
1 	 8.851  8.046
2	21.379 18.506
3	29.080 29.425
4	34.138 34.138
5	41.724 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)-0.3)*365; % convert mnth to d
units.tL_fm = {'d', 'cm'};     label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(26.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AmezMart2006';  treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';     
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '32WCZ'; % Cat of Life
metaData.links.id_ITIS = '616307'; % ITIS
metaData.links.id_EoL = '46570486'; % Ency of Life
metaData.links.id_Wiki = 'Cyclopsetta'; % Wikipedia
metaData.links.id_ADW = 'Cyclopsetta_querna'; % ADW
metaData.links.id_Taxo = '172500'; % Taxonomicon
metaData.links.id_WoRMS = '275703'; % WoRMS
metaData.links.id_fishbase = 'Cyclopsetta-querna'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyclopsetta_querna}}';
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
bibkey = 'AmezMart2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-005-0302-6}, ' ...
'author = {Felipe Amezcua and Ivan Mart\''{i}nez-Tovar and Yanira Green-Ruiz and Felipe Amezcua-Linares}, ' ...
'year = {2006}, ' ...
'title = {Use of otoliths to determine age and growth of a tropical flatfish \emph{Cyclopsetta querna} ({P}aralichthyidae) from the southeast coast of the {G}ulf of {C}alifornia, {M}exico}, ' ...
'journal = {Ichthyol. Res.}, ' ...
'volume = {53}, ' ...
'pages = {70–74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Cyclopsetta-querna.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

