function [data, auxData, metaData, txtData, weights] = mydata_Mugil_curemaOsteomugil_cunnesius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Osteomugil_cunnesius'; 
metaData.species_en = 'Longarm mullet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 18];

%% set data
% zero-variate data

data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15.1;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 41;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm for Mugil cephalus: pi/6*0.09^3';
data.Wwp = 34.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^2.95, see F1';
data.Wwi = 657;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^2.95, see F1';
  
data.Ri  = 3.6e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Mugil_curema: 4e6*657/7220';
  
% uni-variate data
% time-length
data.tL= [ ... % time (d), total length (cm)
153.178	6.174
339.947	9.421
365+0.624	10.020
365+33.954	10.551
365+61.047	10.833
365+94.427	10.724
365+121.507	11.166
365+154.173	11.296
365+183.345	11.660
365+214.571	12.428
365+276.378	13.323
730+121.254	14.445];
data.tL(:,1) = 50+data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'female'};  bibkey.tL = 'AguiGall1999';
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'Data from 2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01148*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '75BCQ'; % Cat of Life
metaData.links.id_ITIS = '170418'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Osteomugil'; % Wikipedia
metaData.links.id_ADW = 'Mugil_cunnesius'; % ADW
metaData.links.id_Taxo = '5554735'; % Taxonomicon
metaData.links.id_WoRMS = '1042879'; % WoRMS
metaData.links.id_fishbase = 'Osteomugil-cunnesius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Osteomugil}}';
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
bibkey = 'AguiGall1999'; type = 'Article'; bib = [ ... 
'author = {Ana L. Iba\~{n}ez Aguirre and Manuel Gallardo-Cabello and Xavier Chiappa Carrara}, ' ... 
'year = {1999}, ' ...
'title = {Growth analysis of striped mullet, \emph{Mugil cephalus}, and white mullet, \emph{M. curema} ({P}isces: {M}ugilidae), in the {G}ulf of {M}exico}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {97}, ' ...
'pages = {861-872}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Osteomugil-cunnesius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

