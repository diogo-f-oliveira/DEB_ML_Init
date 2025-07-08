function [data, auxData, metaData, txtData, weights] = mydata_Alepocephalus_rostratus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Alepocephaliformes'; 
metaData.family     = 'Alepocephalidae';
metaData.species    = 'Alepocephalus_rostratus'; 
metaData.species_en = 'Risso''s smooth-head'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mpb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCij'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 03];

%% set data
% zero-variate data

data.am = 23*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0477;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4.5 mm of Alepocephalus_bairdii: pi/6*0.45^3';
data.Wwp = 115.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00316*Lp^3.17, see F2';
data.Wwi = 768;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00316*Li^3.17, see F2';

data.GSI  = 0.025;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'FollPorc2007';   
  temp.GSI = C2K(8.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 10.7
    1 15.3
    2 18.1
    3 19.5
    4 21.6
    5 22.8
    6 24.5
    7 26.0
    8 28.3
    9 29.4
   10 30.9
   11 32.7
   12 33.8
   13 35.4
   14 36.3
   15 35.4
   16 36.9
   17 36.6
   18 38.2
   19 38.2
   20 42.0
   21 38.8
   22 40.7
   23 45.0];
data.tL(:,1) = 365*(2.9+data.tL(:,1)); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(8.5);  units.temp.tL = 'K'; label.temp.L = 'temperature';
bibkey.tL = 'NinMassu1996';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'I had to add 2 yrs to age estimates in tL data to arrive at a good fit';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'preferred temp 8.5 C; bathydemersal';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Length-weight: Ww in g = 0.00316*(TL in cm)^3.17'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '667PL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46562771'; % Ency of Life
metaData.links.id_Wiki = 'Alepocephalus'; % Wikipedia
metaData.links.id_ADW = 'Alepocephalus_rostratus'; % ADW
metaData.links.id_Taxo = '160358'; % Taxonomicon
metaData.links.id_WoRMS = '126684'; % WoRMS
metaData.links.id_fishbase = 'Alepocephalus-bairdii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alepocephalus}}';
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
bibkey = 'NinMassu1996'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1996.tb01807.x}, ' ...
'author = {B. Morales-Nin and E. Massut\''{i} and C. Stefanescu}, ' ... 
'year = {1996}, ' ...
'title = {Distribution and biology of \emph{Alepocephalus rostratus} from the {M}editerranean {S}ea}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {48(6)}, ' ...
'pages = {1097–1112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FollPorc2007'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0485.2007.00181.x}, ' ...
'author = {Maria Cristina Follesa and Cristina Porcu and Serenella Cabiddu and Mario A. Davini and Andrea Sabatini and Angelo Cau}, ' ... 
'year = {2007}, ' ...
'title = {First observations on the reproduction of \emph{Alepocephalus rostratus} {R}isso, 1820 ({O}steichthyes, {A}lepocephalidae) from the {S}ardinian {C}hannel ({C}entral-{W}estern {M}editerranean)}, ' ...
'journal = {Marine Ecology}, ' ...
'volume = {28(Supplement s1)}, ' ...
'pages = {75–81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alepocephalus-rostratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

