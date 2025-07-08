function [data, auxData, metaData, txtData, weights] = mydata_Centroscymnus_plunketi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Somniosidae';
metaData.species    = 'Centroscymnus_plunketi'; 
metaData.species_en = 'Plunket shark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIS','MPS'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.9); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 19];                          
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
data.ab = 3*365; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'FranJone2018';   
  temp.ab = C2K(6.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 53*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranJone2018';   
  temp.am = C2K(6.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 30;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'FranJone2018';
data.Lp = 128.5;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'FranJone2018';
data.Lpm = 109.5; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'FranJone2018';
data.Li  = 150;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'FranJone2018';
data.Lim  = 133; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'FranJone2018';

data.Wwb  = 268;  units.Wwb  = 'g';    label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'FranJone2018';
  comment.Wwb = 'based on egg diameter of 8 cm: pi/6*8^3';
data.Wwi  = 31.7e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','FranJone2018'};
  comment.Wwi = 'based on 0.00490*Li^3.13, see F3';
data.Wwim  = 21.8e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'fishbase','FranJone2018'};
  comment.Wwim = 'based on 0.00490*Lim^3.13, see F3';

data.Ri  = 23/365/5;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'FranJone2018';   
  temp.Ri = C2K(6.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '23 pups per litter, 1 litter per at 5 yr assumed';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	30.882
20.561	77.937
35.876	120.950
39.853	123.643
40.973	124.994
41.090	117.188
43.350	146.360
43.580	123.282
45.945	128.699
53.015	116.102];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(6.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranJone2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.000	30.543
24.169	84.704
25.534	83.339
33.637	117.230
36.496	119.929
41.959	116.165];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(6.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranJone2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'bathydemersal; depth range 550 - 732 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00490 * (TL in cm)^3.13';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'SBFX'; % Cat of Life
metaData.links.id_ITIS = '160734'; % ITIS
metaData.links.id_EoL = '46560300'; % Ency of Life
metaData.links.id_Wiki = 'Centroscymnus_plunketi'; % Wikipedia
metaData.links.id_ADW = 'Centroscymnus_plunketi'; % ADW
metaData.links.id_Taxo = '106271'; % Taxonomicon
metaData.links.id_WoRMS = '299090'; % WoRMS
metaData.links.id_fishbase = 'Centroscymnus-plunketi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scymnodon_plunketi}}';  
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
bibkey = 'FranJone2018'; type = 'techreport'; bib = [ ... 
'isbn = {ISBN 978-1-77665-768-1}, ' ...
'author = {M. P . Francis and E. G. Jones and C. \''{O}. Maolag\''{a}in and W. S. Lyon}, ' ...
'year = {2018}, ' ...
'title  = {Growth and reproduction of four deepwater sharks in New Zealand waters}, ' ...
'series = {New Zealand Aquatic Environment and Biodiversity}, ' ...
'volume = {196}, ' ...
'institution = {Ministry for Primary Industries, PO Box 2526, WELLINGTON 6140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Centroscymnus-plunketi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

