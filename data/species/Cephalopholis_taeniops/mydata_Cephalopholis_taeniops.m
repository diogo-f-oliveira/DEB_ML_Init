function [data, auxData, metaData, txtData, weights] = mydata_Cephalopholis_taeniops

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Cephalopholis_taeniops'; 
metaData.species_en = 'Bluespotted seabass'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 30];

%% set data
% zero-variate data

data.ab = 12; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(19.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'TariPaju2015';   
  temp.am = C2K(19.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 70;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 78;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.10, see F1';
data.Wwi = 5246;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.10, see F1; max. published weight: 24.2 kg';

data.GSI = 0.03; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(19.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cephalopholis_cyanostigma';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0  9.04
    1 15.70
    2 18.96
    3 23.21
    4 25.94
    5 30.71
    6 33.71
    7 36.20
    8 38.37
    9 40.17
   10 42.75
   11 44.08
   12 45.01
   13 45.45
   14 46.21
   15 47.50
   16 48.31
   17 49.02
   18 49.78
   19 50.35
   20 51.10];
data.tL(:,1) = (1.3+data.tL(:,1)) * 365;
%for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.2);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'TariPaju2015'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SDPG'; % Cat of Life
metaData.links.id_ITIS = '551033'; % ITIS
metaData.links.id_EoL = '46579791'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopholis_taeniops'; % Wikipedia
metaData.links.id_ADW = 'Cephalopholis_taeniops'; % ADW
metaData.links.id_Taxo = '166799'; % Taxonomicon
metaData.links.id_WoRMS = '279154'; % WoRMS
metaData.links.id_fishbase = 'Cephalopholis-taeniops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalopholis_taeniops}}';
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
bibkey = 'TariPaju2015'; type = 'article'; bib = [ ... 
'doi = {10.1017/S0025315414001441}, ' ...
'author = {Tariche, O. and J.G. Pajuelo and J.M. Lorenzo and A. Luque and J.A. Gonzalez}, ' ... 
'year = {2015}, ' ...
'title = {Age estimation and growth pattern of the grouper \emph{Cephalopholis taeniops} ({E}pinephelidae) off the {C}ape {V}erde {A}rchipelago, north-west {A}frica. }, ' ...
'journal = {J. Mar. Biol. Assoc. UK.}, ' ...
'volume = {95(3)}, '...
'pages = {599–609}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cephalopholis-taeniops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

