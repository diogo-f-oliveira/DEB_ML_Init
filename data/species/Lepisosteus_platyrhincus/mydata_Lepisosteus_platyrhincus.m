function [data, auxData, metaData, txtData, weights] = mydata_Lepisosteus_platyrhincus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lepisosteiformes'; 
metaData.family     = 'Lepisosteidae';
metaData.species    = 'Lepisosteus_platyrhincus'; 
metaData.species_en = 'Florida gar'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl','0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb';  'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 09 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.tp = 3.5*365;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'fishbase';   
  temp.am = C2K(20);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 45;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'ADW','MuriPark2009'};
  comment.Lp = 'based on tp and tL data';
data.Li  = 132;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb  = 8.2e-3;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 2.5 mm for Lepisosteus_platostomus: pi/6*0.25^3';
data.Wwi  = 12.68e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00229*Li^3.18, see F2';

data.Ri  = 6000/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed size TL 78 cm';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
1.013	32.173
2.036	37.332
3.092	43.418
4.115	48.709
4.976	49.631
6.092	51.742
7.115	55.709
7.977	58.485
8.993	54.637
10.081	60.855
11.004	60.452
12.020	56.736
13.012	63.220
13.966	61.359
15.015	58.836
17.022	58.822];
data.tL_f(:,1) = 365 * (2 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  bibkey.tL_f = 'MuriPark2009';
temp.tL_f = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
1.107	30.186
2.035	36.273
3.091	42.491
4.144	44.206
5.038	47.246
6.059	50.418
8.033	49.478
9.023	52.783
10.039	48.538];
data.tL_m(:,1) = 365 * (2 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  bibkey.tL_m = 'MuriPark2009';
temp.tL_m = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males ase assumed to differ froam females by {p_Am} and E_Hp only';
D2 = 'It was necessary to add 2 yr to age-estimate to arrive at a natural fit';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'From photo: SL = 0.89 * TL';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00229*(TL in cm)^3.18';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3TFQJ'; % Cat of Life
metaData.links.id_ITIS = '161098'; % ITIS
metaData.links.id_EoL = '848957'; % Ency of Life
metaData.links.id_Wiki = 'Lepisosteus_platyrhincus'; % Wikipedia
metaData.links.id_ADW = 'Lepisosteus_platyrhincus'; % ADW
metaData.links.id_Taxo = '42474'; % Taxonomicon
metaData.links.id_WoRMS = '1017721'; % WoRMS
metaData.links.id_fishbase = 'Lepisosteus-platyrhincus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepisosteus_platyrhincus}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepisosteus-platyrhincus.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuriPark2009'; type = 'article'; bib = [ ...  
'author = {D. J. Murie and D. C. Parkyn and L. G. Nico and J. J. Herod and W. F. Loftus}, ' ...
'year = {2009}, ' ...
'title  = {Age, differential growth and mortality ratesin unexploited populations of Florida gar,an apex predator in the {F}lorida {E}verglades}, ' ...
'journal = {Fisheries Management and Ecology}, ' ...
'volume  = {16}, ' ...
'pages = {315-322}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lepisosteus_platyrhincus/}}';   
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

