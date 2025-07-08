function [data, auxData, metaData, txtData, weights] = mydata_Lepisosteus_platostomus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lepisosteiformes'; 
metaData.family     = 'Lepisosteidae';
metaData.species    = 'Lepisosteus_platostomus'; 
metaData.species_en = 'Shortnose gar'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl','0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb';  'Wwi'; 'R_Ww'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 06 30];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 06 30]; 

%% set data
% zero-variate data;
data.ab = 9;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'Wiki';
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'fishbase';   
  temp.am = C2K(20);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 38;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';
data.Li  = 88;       units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb  = 8.2e-3;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi  = 3.65e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00229*Li^3.19, see F2';
  

data.RW  = 36460/365; units.RW  = '#/d'; label.RW  = 'reprod rate at Ww 4.1 kg';   bibkey.RW  = 'WallYeag1990';   
  temp.RW = C2K(20);  units.temp.RW = 'K'; label.temp.RW = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm) 
2.021	49.893
3.019	54.798
3.961	57.014
4.996	60.210
5.975	59.982
7.029	62.200
8.007	63.195
9.042	63.946];
data.tL(:,1) = 365 * (3.5 + data.tL(:,1));
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = 'SuttGrie2009';
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

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
D1 = 'It was necessary to add 3 yrs to age in tL data to arrive at the correct origin';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'From photo: SL = 0.89 * TL';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00229*(TL in cm)^3.19';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3TFQH'; % Cat of Life
metaData.links.id_ITIS = '161096'; % ITIS
metaData.links.id_EoL = '207656'; % Ency of Life
metaData.links.id_Wiki = 'Lepisosteus_platostomus'; % Wikipedia
metaData.links.id_ADW = 'Lepisosteus_platostomus'; % ADW
metaData.links.id_Taxo = '42473'; % Taxonomicon
metaData.links.id_WoRMS = '1017720'; % WoRMS
metaData.links.id_fishbase = 'Lepisosteus-platostomus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepisosteus_platostomus}}';  
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
bibkey = 'seriouslyfish'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.seriouslyfish.com/species/search/Lepisosteus_osseus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepisosteus-platostomus.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ... 
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lepisosteus_platostomus/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SuttGrie2009'; type = 'Article'; bib = [ ...  
'author = {Trent M. Sutton and Angela C. Grier and Leslie D. Frankland}, ' ...
'doi = {10.1080/02705060.2009.9664344}, ' ...
'year = {2009}, ' ...
'title  = {Stock Structure and Dynamics of Longnose Gar and Shortnose Gar in the {W}abash {R}iver, {I}ndiana-{I}llinois}, ' ...
'journal = {Journal of Freshwater Ecology}, ' ...
'volume = {24}, ' ...
'pages = {657-666}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

