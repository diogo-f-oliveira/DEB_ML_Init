function [data, auxData, metaData, txtData, weights] = mydata_Centroscymnus_crepidater

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Somniosidae';
metaData.species    = 'Centroscymnus_crepidater'; 
metaData.species_en = 'Longnose velvet dogfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
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
data.ab = 2*365; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'FranJone2018';   
  temp.ab = C2K(6.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 26.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranJone2018';   
  temp.am = C2K(6.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 30;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'FranJone2018';
data.Lp = 86;   units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'FranJone2018';
  comment.Lp = '76-102 cm';
data.Lpm = 65.4;   units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'FranJone2018';
  comment.Lpm = '59-81 cm';
data.Li  = 105;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'FranJone2018';
data.Lim  = 93; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'FranJone2018';

data.Wwi  = 10.1e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','FranJone2018'};
  comment.Wwi = 'based on 0.00457*Li^3.14, see F3';
data.Wwim  = 6.9e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'fishbase','FranJone2018'};
  comment.Wwim = 'based on 0.00457*Lim^3.14, see F3';

data.Ri  = 8/365/3;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'FranJone2018';   
  temp.Ri = C2K(6.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-10 pups per litter, 1 litter per at 3 yr';
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	30.423
6.547	55.211
7.970	90.516
9.937	78.498
10.969	76.056
11.016	77.559
11.114	88.451
11.490	89.390
12.054	89.390
13.511	93.521
15.437	95.587
15.901	82.441
17.079	92.582
18.437	85.070
20.458	91.268
20.502	82.441
25.483	93.521
26.514	90.516];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(7.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranJone2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.000	30.423
4.997	51.080
8.428	61.221
9.370	70.798
9.932	66.291
13.502	70.423
14.440	69.484
15.989	67.230
17.070	71.925];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(7.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F2 = 'bathydemersal; depth range 200 - 2490 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00457 * (TL in cm)^3.14';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'SBFM'; % Cat of Life
metaData.links.id_ITIS = '160725'; % ITIS
metaData.links.id_EoL = '46560296'; % Ency of Life
metaData.links.id_Wiki = 'Centroscymnus_crepidater'; % Wikipedia
metaData.links.id_ADW = 'Centroscymnus_crepidater'; % ADW
metaData.links.id_Taxo = '41813'; % Taxonomicon
metaData.links.id_WoRMS = '105908'; % WoRMS
metaData.links.id_fishbase = 'Centroscymnus-crepidater'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centroselachus_crepidater}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Centroscymnus-crepidater.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

