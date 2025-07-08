function [data, auxData, metaData, txtData, weights] = mydata_Harengula_jaguana

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Harengula_jaguana'; 
metaData.species_en = 'Scaled herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPSW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 03];

%% set data
% zero-variate data;

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 8.1;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 21.2; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.0024; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HoudRinch1974';
  comment.Wwb = 'based on egg diameter of 1.66 mm: pi/6*0.166^3';
data.Wwp = 5.38;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.05, see F1';
data.Wwi = 101.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.05, see F1';

data.Ri  = 52000/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(28.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ...    % time since birth (yr), total length (cm)
    1  4.3
    2  6.1
    3  8.1
    4 10.2
    5 11.4
    6 12.3
    7 12.04]; 
data.tL(:,1) = (data.tL(:,1)+0)*365; % set origin to birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Leon1989';
comment.tL = 'otholith data; given the reported am, it might be possible that 2 bands per yr occur';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00912*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3JQR5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46562470'; % Ency of Life
metaData.links.id_Wiki = 'Harengula_jaguana'; % Wikipedia
metaData.links.id_ADW = 'Harengula_jaguana'; % ADW
metaData.links.id_Taxo = '176122'; % Taxonomicon
metaData.links.id_WoRMS = '277551'; % WoRMS
metaData.links.id_fishbase = 'Harengula-jaguana'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Harengula_jaguana}}';
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
bibkey = 'Leon1989'; type = 'inproceedings'; bib = [ ... 
'howpublished = {\url{http://hdl.handle.net/1834/28759}}, ' ...
'author = {Leonce-Valencia, C.O.}, ' ... 
'year = {1989}, ' ...
'title = {Age and growth of the scaled sardine (\emph{Harengula jaguana}, {P}oey, 1865) along the {Y}ucatan coast, {M}exico}, ' ...
'institution = {Proceedings of th 45th Gulf and Carribean Fisheries Institute}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoudRinch1974'; type = 'article'; bib = [ ... 
'howpublished = {\url{http://hdl.handle.net/1834/28759}}, ' ...
'author = {Edward D. Houde and William J. Rinchards and Vishnu P. Saksena}, ' ... 
'year = {1974}, ' ...
'title = {DESCRIPTION OF EGGS AND LARVAE OF SCALED SARDINE, \emph{Harengula jaguana}}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {72(4)}, ' ...
'pages = {1106-1122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Harengula-jaguana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
